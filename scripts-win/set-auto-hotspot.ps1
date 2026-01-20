$destinationFolder = "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\auto-hotspot"
$destinationFolder1 = "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup"

New-Item -ItemType Directory -Force -Path $destinationFolder

Copy-Item -Path "misc/auto-hotspot.ps1" -Destination $destinationFolder

Copy-Item -Path "misc/run-auto-hotspot.bat" -Destination $destinationFolder1
