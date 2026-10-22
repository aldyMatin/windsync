[CmdletBinding()]
param(
    [ValidatePattern('^[A-Za-z0-9-]+/[A-Za-z0-9_.-]+$')]
    [string]$Repository = 'aldyMatin/windsync',
    [ValidatePattern('^[A-Za-z0-9_]+$')]
    [string]$KoFiUsername,
    [ValidatePattern('^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$')]
    [string]$ContactEmail
)
$ErrorActionPreference = 'Stop'
$root = Split-Path $PSScriptRoot -Parent
$utf8 = New-Object System.Text.UTF8Encoding($false)
# File eksplisit: tidak membaca source private atau mengganti dokumen lain.
foreach ($relative in @('README.md', '.github/ISSUE_TEMPLATE/config.yml')) {
    $path = Join-Path $root $relative
    $text = [IO.File]::ReadAllText($path)
    $text = [regex]::Replace($text, 'https://github\.com/[A-Za-z0-9-]+/[A-Za-z0-9_.-]+(?=/)', "https://github.com/$Repository")
    [IO.File]::WriteAllText($path, $text, $utf8)
}
if ($KoFiUsername) {
    [IO.File]::WriteAllText((Join-Path $root '.github/FUNDING.yml'), "ko_fi: $KoFiUsername`n", $utf8)
    $path = Join-Path $root 'SUPPORT_DEVELOPMENT.md'
    $text = [IO.File]::ReadAllText($path)
    $text = [regex]::Replace($text, '(?m)^\*\*Tautan Ko-fi sedang disiapkan\.\*\*.*$', "[Traktir melalui Ko-fi](https://ko-fi.com/$KoFiUsername)")
    $text = [regex]::Replace($text, 'https://ko-fi\.com/[A-Za-z0-9_]+', "https://ko-fi.com/$KoFiUsername")
    [IO.File]::WriteAllText($path, $text, $utf8)
}
if ($ContactEmail) {
    foreach ($relative in @('PRIVACY.md', 'SECURITY.md')) {
        $path = Join-Path $root $relative
        $text = [IO.File]::ReadAllText($path).Replace('PENDING_PRIVACY_EMAIL', $ContactEmail).Replace('PENDING_SECURITY_EMAIL', $ContactEmail)
        [IO.File]::WriteAllText($path, $text, $utf8)
    }
}
Write-Host 'Konfigurasi lokal diperbarui. Tidak ada repository yang dibuat/diubah di GitHub.'
