[CmdletBinding()]
param([switch]$RequireConfigured)
$ErrorActionPreference = 'Stop'
$root = [IO.Path]::GetFullPath((Split-Path $PSScriptRoot -Parent))
$prefix = $root + [IO.Path]::DirectorySeparatorChar
$errors = New-Object 'System.Collections.Generic.List[string]'
$files = Get-ChildItem -LiteralPath $root -Recurse -File -Force | Where-Object { $_.FullName -notmatch '[\\/]\.git[\\/]' }
foreach ($file in $files) {
    $relative = $file.FullName.Substring($prefix.Length).Replace('\', '/')
    if ($file.Extension -notin @('.md', '.yml', '.ps1', '.png', '.txt') -and $file.Name -notin @('.gitignore', '.gitattributes')) {
        $errors.Add("Jenis file tidak diizinkan: $relative")
    }
    if ($relative -match '(^|/)(lib|native|android|windows|build|\.dart_tool|node_modules)/|(^|/)(\.env.*|key\.properties|google-services\.json)$') {
        $errors.Add("Path internal tidak boleh dipublikasikan: $relative")
    }
    if ($file.Extension -eq '.png') { continue }
    $text = [IO.File]::ReadAllText($file.FullName)
    if ($text -match '-----BEGIN (RSA |EC |OPENSSH )?PRIVATE KEY-----|gh[pousr]_[A-Za-z0-9]{20,}|github_pat_[A-Za-z0-9_]{20,}|AIza[0-9A-Za-z_-]{30,}') {
        $errors.Add("Pola rahasia terdeteksi: $relative")
    }
    if ($file.Extension -eq '.md') {
        foreach ($match in [regex]::Matches($text, '\]\(([^)]+)\)')) {
            $target = $match.Groups[1].Value.Split('#')[0]
            if (-not $target -or $target -match '^[a-zA-Z][a-zA-Z0-9+.-]*:') { continue }
            $resolved = [IO.Path]::GetFullPath((Join-Path $file.DirectoryName $target))
            if (-not $resolved.StartsWith($prefix, [StringComparison]::OrdinalIgnoreCase) -or -not (Test-Path -LiteralPath $resolved)) {
                $errors.Add("Tautan lokal rusak/keluar paket: $relative -> $target")
            }
        }
    }
    if ($RequireConfigured -and $file.Extension -eq '.md' -and $relative -notin @('MAINTAINER_SETUP.md') -and $text -match 'PENDING_(PRIVACY|SECURITY)_EMAIL') {
        $errors.Add("Kontak belum dikonfigurasi: $relative")
    }
}
if ($RequireConfigured -and [IO.File]::ReadAllText((Join-Path $root '.github/FUNDING.yml')) -notmatch '(?m)^ko_fi: [A-Za-z0-9_]+\s*$') {
    $errors.Add('Username Ko-fi belum dikonfigurasi.')
}
if ($errors.Count) { throw ($errors -join "`n") }
Write-Host "PASS: $($files.Count) file; jenis file, pola rahasia dasar, dan tautan Markdown lokal diperiksa."
Write-Host 'Bukan audit keamanan binary atau persetujuan rilis; selesaikan checklist pengelola.'
