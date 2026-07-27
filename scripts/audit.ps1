<#
.SYNOPSIS
    Audits every Markdown file against the standards this repository publishes.

.DESCRIPTION
    Enforces docs/Style-Guide.md and CONTRIBUTING.md mechanically. A standard
    that is documented but not checked drifts within a release.

    Checks:
      STRUCTURE  exactly one H1; no skipped heading levels; unique headings
      SECTIONS   every file ends with Related and References
      ENTRIES    files under prompts/ carry all ten mandatory sections in order
      CODE       every fenced block is language-tagged
      CALLOUTS   at most three GitHub alerts per file; only valid alert types
      WORDS      no terms from the Style Guide avoid list
      TERMS      consistent terminology
      NAMING     kebab-case entries, Title-Case-Hyphenated docs
      WHITESPACE final newline present; no trailing spaces

.EXAMPLE
    ./scripts/audit.ps1
    ./scripts/audit.ps1 -Check CODE,WORDS

.OUTPUTS
    Exit code 0 if clean, 1 if any finding.
#>

[CmdletBinding()]
param(
    [string]$Root = (Split-Path $PSScriptRoot -Parent),
    [string[]]$Check = @('STRUCTURE','SECTIONS','ENTRIES','CODE','CALLOUTS','WORDS','TERMS','NAMING','WHITESPACE')
)

$findings = [System.Collections.Generic.List[psobject]]::new()

function Add-Finding {
    param($File, $Check, $Line, $Detail)
    $findings.Add([pscustomobject]@{ File = $File; Check = $Check; Line = $Line; Detail = $Detail })
}

# Style-Guide.md "Words to Avoid".
#
# These target the word's FUNCTION, not the letters. "highest-leverage" is a
# compound noun and legitimate; "leverage our expertise" is the banned verb.
# Patterns are written to match the filler use only.
$avoidWords = @(
    # "simply run X" is condescending; "a simply connected space" is not.
    @{ w = 'simply (filler)';          p = '(?i)\bsimply\b(?!\s+connected)' },
    # "Obviously, you..." condescends. "obviously bad work" describes a
    # property of the work and is legitimate. Flag the reader-directed form.
    @{ w = 'obviously (condescending)'; p = '(?im)(^|[.!?]\s+)obviously\b|\bobviously\s+you\b' },
    @{ w = 'of course (condescending)'; p = '(?im)(^|[.!?]\s+)of course\b|\bof course\s+you\b' },
    @{ w = 'leverage (verb)';          p = '(?i)(?<!-)\bleverage\s+(our|your|their|the|this|these|its)\b' },
    @{ w = 'utilise';                  p = '(?i)\butilis[ez]\w*\b' },
    @{ w = 'seamless';                 p = '(?i)\bseamless\w*\b' },
    @{ w = 'cutting-edge';             p = '(?i)\bcutting-edge\b' },
    @{ w = 'state-of-the-art';         p = '(?i)\bstate-of-the-art\b' },
    @{ w = "in today's";               p = "(?i)\bin today's\b" },
    @{ w = 'it is important to note';  p = '(?i)\bit is important to note\b' },
    @{ w = 'delve';                    p = '(?i)\bdelv(e|es|ing)\b' },
    @{ w = 'tapestry';                 p = '(?i)\btapestry\b' },
    @{ w = 'should probably';          p = '(?i)\bshould probably\b' }
)

# Terminology: pattern -> correct form. Anchored to avoid matching package
# names (@anthropic-ai/claude-code), repository names, and heading anchors.
$terms = @(
    @{ p = '(?<![-/\w#])claude-code(?![-\w])'; r = 'Claude Code' },
    @{ p = '\bClaudeCode\b';                   r = 'Claude Code' },
    @{ p = '\bsub-agents?\b';                  r = 'subagent' },
    @{ p = '(?<![-/\w])claude\.md\b';          r = 'CLAUDE.md' }
)

$validAlerts = @('NOTE','TIP','IMPORTANT','WARNING','CAUTION')

$requiredEntrySections = @(
    'Purpose','When to Use','Inputs Required','Workflow','Claude Prompt',
    'Expected Output','Quality Checklist','Common Mistakes','Example','Advanced Version'
)

$files = Get-ChildItem -Path $Root -Recurse -Filter *.md -File |
    Where-Object { $_.FullName -notlike "*$([IO.Path]::DirectorySeparatorChar).git$([IO.Path]::DirectorySeparatorChar)*" }

foreach ($file in $files) {
    $rel   = $file.FullName.Substring($Root.Length + 1)
    $raw   = Get-Content $file.FullName -Raw
    $lines = Get-Content $file.FullName
    if ($null -eq $raw) { $raw = '' }

    # Body with fenced code blocks removed, for prose-level checks.
    $prose = [regex]::Replace($raw, '(?ms)^```.*?^```', '')

    $sep        = [IO.Path]::DirectorySeparatorChar
    $isEntry    = $rel -like "prompts$sep*" -and $file.Name -ne 'README.md'

    # Files whose structure is set by an external standard. Overriding a
    # recognised format to satisfy a house rule makes it harder to read for
    # everyone who already knows the format. See docs/Style-Guide.md.
    $sectionsExempt = @('CHANGELOG.md', 'CODE_OF_CONDUCT.md', 'LICENSE') -contains $file.Name -or
                      $rel -like ".github$sep*" -or
                      $rel -like "templates$sep*"

    # A line is "quoting the ban" if the flagged term sits inside quotation
    # marks or backticks, or the line is a table row explaining the rule.
    function Test-QuotesTheBan {
        param([string]$Line, [string]$Pattern)
        foreach ($m in [regex]::Matches($Line, '"[^"]*"|''[^'']*''|`[^`]*`')) {
            if ($m.Value -match $Pattern) { return $true }
        }
        return $false
    }

    # ---------- STRUCTURE ----------
    if ($Check -contains 'STRUCTURE') {
        $headings = [regex]::Matches($prose, '(?m)^(#{1,6})\s+(.+?)\s*$')
        $h1 = @($headings | Where-Object { $_.Groups[1].Value.Length -eq 1 })
        if ($h1.Count -ne 1) {
            Add-Finding $rel 'STRUCTURE' 0 "Expected exactly one H1, found $($h1.Count)"
        }

        # Duplicate headings are checked siblings-only, matching MD024 in
        # .markdownlint.json. Keep a Changelog repeats "Added" under each
        # version by design, and that is correct.
        $prev = 0
        $seen = @{}
        foreach ($h in $headings) {
            $level = $h.Groups[1].Value.Length
            $text  = $h.Groups[2].Value
            if ($prev -gt 0 -and ($level - $prev) -gt 1) {
                Add-Finding $rel 'STRUCTURE' 0 "Heading level skips H$prev -> H$level at '$text'"
            }
            $prev = $level

            $key = "$level|$($text.ToLower())"
            if ($seen.ContainsKey($key) -and $file.Name -ne 'CHANGELOG.md') {
                Add-Finding $rel 'STRUCTURE' 0 "Duplicate sibling heading '$text' breaks anchor links"
            }
            $seen[$key] = $true
        }
    }

    # ---------- SECTIONS ----------
    if ($Check -contains 'SECTIONS' -and -not $sectionsExempt) {
        if ($prose -notmatch '(?m)^##\s+Related\s*$')    { Add-Finding $rel 'SECTIONS' 0 'Missing "## Related" section' }
        if ($prose -notmatch '(?m)^##\s+References\s*$') { Add-Finding $rel 'SECTIONS' 0 'Missing "## References" section' }
    }

    # ---------- ENTRIES ----------
    if ($Check -contains 'ENTRIES' -and $isEntry) {
        $found = [regex]::Matches($prose, '(?m)^##\s+(.+?)\s*$') | ForEach-Object { $_.Groups[1].Value }
        $idx = 0
        foreach ($required in $requiredEntrySections) {
            $pos = [array]::IndexOf($found, $required)
            if ($pos -lt 0) {
                Add-Finding $rel 'ENTRIES' 0 "Missing mandatory section '## $required'"
            } elseif ($pos -lt $idx) {
                Add-Finding $rel 'ENTRIES' 0 "Section '## $required' is out of the mandated order"
            } else {
                $idx = $pos
            }
        }
    }

    # ---------- CODE ----------
    # Tracks the opening fence length so a 3-backtick block nested inside a
    # 4-backtick block is not mistaken for a close. A 3-backtick fence nested
    # inside another 3-backtick fence is a real rendering bug and is reported.
    if ($Check -contains 'CODE') {
        $n = 0
        $fenceLen = 0
        foreach ($line in $lines) {
            $n++
            if ($line -notmatch '^\s*(`{3,})(.*)$') { continue }
            $ticks = $Matches[1].Length
            $info  = $Matches[2].Trim()

            if ($fenceLen -eq 0) {
                $fenceLen = $ticks
                if ([string]::IsNullOrWhiteSpace($info)) {
                    Add-Finding $rel 'CODE' $n 'Fenced code block has no language tag'
                }
            }
            elseif ($ticks -ge $fenceLen -and [string]::IsNullOrWhiteSpace($info)) {
                $fenceLen = 0
            }
            elseif (-not [string]::IsNullOrWhiteSpace($info) -and $ticks -ge $fenceLen) {
                Add-Finding $rel 'CODE' $n "Nested fence needs more backticks than its parent ($ticks vs $fenceLen); block will terminate early"
            }
        }
        if ($fenceLen -ne 0) { Add-Finding $rel 'CODE' 0 'Unclosed fenced code block' }
    }

    # ---------- CALLOUTS ----------
    # Budget scales with length: roughly one per 100 lines, hard cap of six.
    # See docs/Style-Guide.md#callouts.
    if ($Check -contains 'CALLOUTS') {
        # Anchored to line start so a table row documenting the syntax, or an
        # alert quoted inside backticks, is not counted as a live callout.
        $alerts = [regex]::Matches($prose, '(?m)^\s*>\s*\[!([A-Z]+)\]')
        $budget = [Math]::Min(6, [Math]::Max(3, [Math]::Ceiling($lines.Count / 75)))

        if ($alerts.Count -gt $budget) {
            Add-Finding $rel 'CALLOUTS' 0 "$($alerts.Count) callouts in $($lines.Count) lines; budget is $budget"
        }
        foreach ($a in $alerts) {
            if ($validAlerts -notcontains $a.Groups[1].Value) {
                Add-Finding $rel 'CALLOUTS' 0 "Invalid alert type [!$($a.Groups[1].Value)]"
            }
        }
    }

    # ---------- WORDS ----------
    # The Style Guide necessarily quotes every word it bans, so it is exempt.
    # Elsewhere, a term inside quotation marks or backticks is being quoted as
    # an example of bad writing, which every entry teaching the rule must do.
    if ($Check -contains 'WORDS' -and $rel -notlike '*Style-Guide.md') {
        foreach ($entry in $avoidWords) {
            $n = 0
            foreach ($line in $lines) {
                $n++
                if ($line -notmatch $entry.p) { continue }
                if (Test-QuotesTheBan -Line $line -Pattern $entry.p) { continue }
                Add-Finding $rel 'WORDS' $n "Avoid-list term: $($entry.w)"
            }
        }
    }

    # ---------- TERMS ----------
    if ($Check -contains 'TERMS' -and $rel -notlike '*Style-Guide.md') {
        foreach ($t in $terms) {
            $n = 0
            foreach ($line in $lines) {
                $n++
                if ($line -cnotmatch $t.p) { continue }
                if ($line -match 'https?://') { continue }              # URLs
                if (Test-QuotesTheBan -Line $line -Pattern $t.p) { continue }  # code spans
                Add-Finding $rel 'TERMS' $n "Use '$($t.r)' here"
            }
        }
    }

    # ---------- NAMING ----------
    if ($Check -contains 'NAMING') {
        $name = $file.BaseName
        if ($file.Name -ne 'README.md') {
            if ($rel -like "prompts$([IO.Path]::DirectorySeparatorChar)*" -and $name -cnotmatch '^[a-z0-9]+(-[a-z0-9]+)*$') {
                Add-Finding $rel 'NAMING' 0 "Entry filenames must be kebab-case"
            }
            if ($rel -like "docs$([IO.Path]::DirectorySeparatorChar)*" -and $name -cnotmatch '^[A-Z][A-Za-z0-9]*(-[A-Z][A-Za-z0-9]*)*$') {
                Add-Finding $rel 'NAMING' 0 "docs/ filenames must be Title-Case-Hyphenated"
            }
        }
    }

    # ---------- WHITESPACE ----------
    if ($Check -contains 'WHITESPACE') {
        if ($raw.Length -gt 0 -and -not $raw.EndsWith("`n")) {
            Add-Finding $rel 'WHITESPACE' 0 'No final newline'
        }
        $n = 0
        foreach ($line in $lines) {
            $n++
            if ($line -match '[ \t]+$') { Add-Finding $rel 'WHITESPACE' $n 'Trailing whitespace' }
        }
    }
}

# ---------- REPORT ----------
Write-Output "Files audited : $($files.Count)"
Write-Output "Findings      : $($findings.Count)"
Write-Output ''

if ($findings.Count -gt 0) {
    $findings | Group-Object Check | Sort-Object Count -Descending | ForEach-Object {
        Write-Output "== $($_.Name)  ($($_.Count)) =="
        $_.Group | Group-Object File | ForEach-Object {
            Write-Output "   $($_.Name)"
            $_.Group | Select-Object -First 6 | ForEach-Object {
                $loc = if ($_.Line -gt 0) { ":$($_.Line)" } else { "" }
                Write-Output "      $loc $($_.Detail)"
            }
            if ($_.Count -gt 6) { Write-Output "       ... and $($_.Count - 6) more" }
        }
        Write-Output ''
    }
    exit 1
}

Write-Output 'Clean. Repository conforms to its published standards.'
exit 0
