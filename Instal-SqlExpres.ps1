# PowerShell Script: Install SQL Server 2022 Express Edition

# Variables
$SqlExpressUrl = "https://go.microsoft.com/fwlink/?linkid=2204847"  # Official SQL Server 2022 Express download
$SqlExpressInstaller = "$env:TEMP\SQLServer2022-x64-Express.exe"
$SaPassword = 'YourStrong!Passw0rd' # <-- CHANGE THIS TO A STRONG PASSWORD

# Download SQL Server Express installer using GNU Wget
Write-Host "Downloading SQL Server 2022 Express installer with wget..."
wget $SqlExpressUrl -O $SqlExpressInstaller

# Install SQL Server Express silently
Write-Host "Installing SQL Server 2022 Express..."
$SqlArgs = "/Q /ACTION=Install /FEATURES=SQLEngine /INSTANCENAME=SQLEXPRESS /SECURITYMODE=SQL /SAPWD=`"$SaPassword`" /SQLSVCACCOUNT='NT AUTHORITY\NETWORK SERVICE' /TCPENABLED=1 /IACCEPTSQLSERVERLICENSETERMS"
Start-Process -FilePath $SqlExpressInstaller -ArgumentList $SqlArgs -Wait -NoNewWindow

# Check SQL Server Express service status
Write-Host "Checking SQL Server Express service status..."
Get-Service -Name 'MSSQL$SQLEXPRESS'