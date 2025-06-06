# PowerShell Script: Install Git for Windows

# Variables
$gitUrl = "https://github.com/git-for-windows/git/releases/latest/download/Git-2.44.0-64-bit.exe"
$gitInstaller = "$env:TEMP\Git-2.44.0-64-bit.exe"

# Download Git for Windows installer using GNU Wget
Write-Host "Downloading Git for Windows installer with wget..."
wget $gitUrl -O $gitInstaller

# Install Git silently (no user interaction)
Write-Host "Installing Git for Windows silently..."
Start-Process -FilePath $gitInstaller -ArgumentList "/VERYSILENT" -Wait

Write-Host "Git for Windows installation completed."