# winrarzipzexploit — GitHub Profile README kurulumu
# Repo adi: winrarzipzexploit/winrarzipzexploit (ozel profil reposu)

$ErrorActionPreference = "Stop"
$ProfileDir = $PSScriptRoot
$Username = "winrarzipzexploit"

Set-Location $ProfileDir

Write-Host "`n=== GitHub Profile README Setup ===" -ForegroundColor Cyan
Write-Host "Hedef: https://github.com/$Username" -ForegroundColor Yellow

# gh login kontrol
$gh = Get-Command gh -ErrorAction SilentlyContinue
if (-not $gh) {
    Write-Host "[!] gh yok. Kur: winget install GitHub.cli" -ForegroundColor Red
    exit 1
}

$auth = gh auth status 2>&1
if ($LASTEXITCODE -ne 0) {
    Write-Host "`n[!] GitHub'a giris yapman lazim:" -ForegroundColor Yellow
    Write-Host "    gh auth login" -ForegroundColor White
    Write-Host "    -> GitHub.com -> HTTPS -> Login with browser`n" -ForegroundColor Gray
    gh auth login
}

$actualUser = gh api user -q .login
Write-Host "[*] Giris: $actualUser" -ForegroundColor Green

if ($actualUser -ne $Username) {
    Write-Host "[!] UYARI: GitHub kullanici adin '$actualUser' ama profil '$Username' icin hazirlandi." -ForegroundColor Yellow
    Write-Host "    Ya GitHub'da username'i degistir ya da README'deki isimleri guncelle." -ForegroundColor Yellow
    $Username = $actualUser
}

if (-not (Test-Path ".git")) {
    git init -b main
    git add README.md setup_profile.ps1
    git commit -m "Add profile README — winrarzipzexploit"
}

# Profil reposu var mi?
$repoExists = gh repo view "$Username/$Username" 2>$null
if ($LASTEXITCODE -ne 0) {
    Write-Host "[*] Profil reposu olusturuluyor: $Username/$Username" -ForegroundColor Cyan
    gh repo create "$Username" --public --description "winrarzipzexploit — Cybersecurity & Exploit Research" --source=. --remote=origin --push
} else {
    Write-Host "[*] Repo zaten var, push ediliyor..." -ForegroundColor Cyan
    git remote remove origin 2>$null
    git remote add origin "https://github.com/$Username/$Username.git"
    git push -u origin main --force
}

Write-Host "`n[+] Profil hazir: https://github.com/$Username" -ForegroundColor Green
Write-Host "[+] Telegram: https://t.me/winrarzipsteam" -ForegroundColor Green
Write-Host "`nProfil ayarlari (github.com -> Settings -> Profile):" -ForegroundColor Cyan
Write-Host "  Name: winrarzipzexploit"
Write-Host "  Bio:  Nothing Is Impossible | Cybersecurity & Exploit Research"
Write-Host "  URL:  https://t.me/winrarzipsteam"
