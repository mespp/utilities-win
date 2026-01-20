# download whatsapp
$URL = "https://github.com/mespp/utilities-win/releases/download/apps/whatsapp-2.2546.3.0.msixbundle"
$AppsFolder = Join-Path -Path $PSScriptRoot -ChildPath "apps"

if (-not (Test-Path $AppsFolder)) { New-Item -ItemType Directory -Path $AppsFolder | Out-Null }
cd $AppsFolder

Start-Process -FilePath "curl.exe" -ArgumentList "-L -O $URL" -Wait

# install whatsapp
Start-Process -FilePath "$AppsFolder/whatsapp-2.2546.3.0.msixbundle"

# block msstore autoupdates
cd ..
Start-Process -FilePath "misc/disable-msstore-updates.reg"
