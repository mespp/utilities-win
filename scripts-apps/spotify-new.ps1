# button doesnt work not my fault just there isnt a working extension

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

# add oldLikeButton extension
cd ..
Copy-Item -Path "misc/spicetify-extensions/oldLikeButton.js" -Destination "$env:APPDATA\spicetify\Extensions"
spicetify config extensions oldLikeButton.js
spicetify apply