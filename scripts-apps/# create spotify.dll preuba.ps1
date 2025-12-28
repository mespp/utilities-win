# create spotify.dll.bak
$Dll = "$env:APPDATA\Roaming\Spotify\spotify.bak"

# 3. Verificar si el archivo existe y crear la copia .bak
if (Test-Path $Dll) {
    Copy-Item -Path $Dll -Destination "spotify.dll.bak" -Force
    Write-Host "Cierre exitoso y archivo spotify.dll.bak creado." -ForegroundColor Green
} else {
    Write-Host "No se encontró spotify.dll en la ruta habitual." -ForegroundColor Yellow
}