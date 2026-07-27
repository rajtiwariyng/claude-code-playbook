<#
.SYNOPSIS
    Verifies that every relative Markdown link in the repository resolves.

.DESCRIPTION
    Deep links into this repository are treated as a public API (see CHANGELOG.md),
    so a broken relative link is a defect rather than a cosmetic problem.

    Fenced code blocks and inline code spans are stripped before scanning, because
    documentation about link syntax contains illustrative links that are not real.

    A link to a directory resolves only if that directory contains a README.md.

.EXAMPLE
    pwsh ./scripts/check-links.ps1

.OUTPUTS
    Exit code 0 if all links resolve, 1 otherwise.
#>

[CmdletBinding()]
param(
    [string]$Root = (Split-Path $PSScriptRoot -Parent)
)

$broken = [System.Collections.Generic.List[string]]::new()
$checked = 0

Get-ChildItem -Path $Root -Recurse -Filter *.md -File |
    Where-Object { $_.FullName -notlike "*$([IO.Path]::DirectorySeparatorChar).git$([IO.Path]::DirectorySeparatorChar)*" } |
    ForEach-Object {

        $file = $_
        $text = Get-Content $file.FullName -Raw
        if ([string]::IsNullOrEmpty($text)) { return }

        # Strip fenced code blocks, then inline code spans. Illustrative links
        # inside them are documentation, not navigation.
        $text = [regex]::Replace($text, '(?ms)^```.*?^```', '')
        $text = [regex]::Replace($text, '`[^`]*`', '')

        foreach ($match in [regex]::Matches($text, '\[[^\]]*\]\(([^)\s]+)\)')) {
            $target = $match.Groups[1].Value

            # External, mail, and same-page anchors are out of scope here.
            if ($target -match '^(https?:|mailto:|#)') { continue }

            $checked++

            $path = ($target -split '#')[0]
            if ([string]::IsNullOrWhiteSpace($path)) { continue }

            $resolved = Join-Path $file.DirectoryName $path
            $ok = Test-Path $resolved

            # A directory link needs a README.md to render as anything useful.
            if ($ok -and (Get-Item $resolved).PSIsContainer) {
                $ok = Test-Path (Join-Path $resolved 'README.md')
            }

            if (-not $ok) {
                $relative = $file.FullName.Substring($Root.Length + 1)
                $broken.Add("$relative -> $target")
            }
        }
    }

Write-Output "Relative links checked : $checked"
Write-Output "Broken                 : $($broken.Count)"

if ($broken.Count -gt 0) {
    Write-Output ''
    $broken | Sort-Object -Unique | ForEach-Object { Write-Output "  $_" }
    exit 1
}

Write-Output 'All relative links resolve.'
exit 0
