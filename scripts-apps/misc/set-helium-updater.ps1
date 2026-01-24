New-Item -ItemType Directory -Force -Path "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup"

Copy-Item -Path "helium-updater.bat" -Destination "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup"
