# this not working cause spotx has problems with spotify.dll.bak file

# uninstall current spotify
Start-Process -FilePath "misc/uninstall-spotify.bat" -Wait

# download new spotify
$URL = "https://github.com/mespp/utilities-win/releases/download/apps/spotify-1.2.8.923.exe"
$AppsFolder = Join-Path -Path $PSScriptRoot -ChildPath "apps"

if (-not (Test-Path $AppsFolder)) { New-Item -ItemType Directory -Path $AppsFolder | Out-Null }
cd $AppsFolder

Start-Process -FilePath "curl.exe" -ArgumentList "-L -O $URL" -Wait

# install new spotify
Start-Process -FilePath "$AppsFolder/spotify-1.2.8.923.exe" 
Start-Sleep -Seconds 10

# close spotify
Stop-Process -Name "Spotify" -Force -ErrorAction SilentlyContinue

# falso dllbak
cd $env:APPDATA\Spotify
New-Item -ItemType File -Name Spotify.dll.bak

# install spotx
iex "& { $(iwr -useb 'https://raw.githubusercontent.com/SpotX-Official/SpotX/refs/heads/main/run.ps1') } -new_theme" 

# install spicetify
iwr -useb https://raw.githubusercontent.com/spicetify/cli/main/install.ps1 | iex 

# pause updates with spicetify
spicetify spotify-updates block
