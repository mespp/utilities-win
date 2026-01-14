# uninstall current spotify
Start-Process -FilePath "misc/uninstall-spotify.bat" -Wait
Start-Sleep -Seconds 10

# download spotify
$URL = "https://download.scdn.co/SpotifySetup.exe"
$AppsFolder = Join-Path -Path $PSScriptRoot -ChildPath "apps"

if (-not (Test-Path $AppsFolder)) { New-Item -ItemType Directory -Path $AppsFolder | Out-Null }
cd $AppsFolder

Start-Process -FilePath "curl.exe" -ArgumentList "-L -O $URL" -Wait

# install spotify
Start-Process -FilePath "$AppsFolder/SpotifySetup.exe" 
Start-Sleep -Seconds 10

# close spotify
Stop-Process -Name "Spotify" -Force -ErrorAction SilentlyContinue

# install spicetify
iwr -useb https://raw.githubusercontent.com/spicetify/cli/main/install.ps1 | iex

# add extensions
cd ..
Copy-Item -Path "misc/spicetify-extensions/volumePercentage.js" -Destination "$env:APPDATA\spicetify\Extensions"
Copy-Item -Path "misc/spicetify-extensions/spicetify-playlist-labels.js" -Destination "$env:APPDATA\spicetify\Extensions"
Copy-Item -Path "misc/spicetify-extensions/adblockify.js" -Destination "$env:APPDATA\spicetify\Extensions"
spicetify config extensions volumePercentage.js
spicetify config extensions spicetify-playlist-labels.js
spicetify config extensions adblockify.js
spicetify apply

# close spotify
Stop-Process -Name "Spotify" -Force -ErrorAction SilentlyContinue
