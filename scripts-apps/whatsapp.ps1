# download whatsapp
$URL = "https://github.com/mespp/utilities-win/releases/download/apps/whatsapp-og.msixbundle"
$AppsFolder = Join-Path -Path $PSScriptRoot -ChildPath "apps"

if (-not (Test-Path $AppsFolder)) { New-Item -ItemType Directory -Path $AppsFolder | Out-Null }
cd $AppsFolder

Start-Process -FilePath "curl.exe" -ArgumentList "-L -O $URL" -Wait

# install whatsapp
Start-Process -FilePath "$AppsFolder/whatsapp-og.msixbundle"
