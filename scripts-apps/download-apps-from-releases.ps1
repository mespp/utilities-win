# Download WhatsApp

$URL = "https://github.com/mespp/utilities-win/releases/download/apps/whatsapp-og.msixbundle"
$AppsFolder = Join-Path -Path $PSScriptRoot -ChildPath "apps"

if (-not (Test-Path $AppsFolder)) { New-Item -ItemType Directory -Path $AppsFolder | Out-Null }
cd $AppsFolder

curl.exe -L -O $URL

# Download Spotify

$URL = "https://github.com/mespp/utilities-win/releases/download/apps/spotify-1.2.8.923.exe"
$AppsFolder = Join-Path -Path $PSScriptRoot -ChildPath "apps"

if (-not (Test-Path $AppsFolder)) { New-Item -ItemType Directory -Path $AppsFolder | Out-Null }
cd $AppsFolder

curl.exe -L -O $URL