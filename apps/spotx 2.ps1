# Unistall-Spotify.bat
$batContent = @"
@echo off

set PWSH="%SYSTEMROOT%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -ExecutionPolicy Bypass -Command
set RawGit='https://raw.githubusercontent.com/amd64fox/Uninstall-Spotify/refs/heads/main/core.ps1'
set JsDelivr='https://cdn.jsdelivr.net/gh/amd64fox/Uninstall-Spotify@refs/heads/main/core.ps1'
set TLS=[Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor [Net.SecurityProtocolType]::Tls12;

if "%1"=="e" goto :run

%PWSH% "([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)" | findstr "True" >nul

if %errorLevel% == 0 (
    goto :run
) else (
    %PWSH% "try { start wt 'cmd /c \"%~dpnx0\" e' -v RunAs } catch { start cmd '/c \"%~dpnx0\" e' -v RunAs}"
    exit /b
)

:run
if exist "%~dp0core.ps1" (
    %PWSH% "& { $(Get-Content '%~dp0core.ps1' -Raw) } | iex"
) else (
    %PWSH% %TLS% "& { $(try { iwr -useb %RawGit% } catch { iwr -useb %JsDelivr% }) } | iex"
)

exit /b
"@
$tempBat = Join-Path $env:TEMP ("uninstall_spotify_{0}.bat" -f ([guid]::NewGuid()))
Set-Content -Path $tempBat -Value $batContent -Encoding Ascii

Start-Process -FilePath $tempBat -Wait -NoNewWindow

Remove-Item $tempBat -Force


# SpotX Installer
iex "& { $(iwr -useb 'https://raw.githubusercontent.com/SpotX-Official/SpotX/refs/heads/main/run.ps1') } -new_theme"

# Spicetify Installer
iwr -useb https://raw.githubusercontent.com/spicetify/cli/main/install.ps1 | iex

# Spicetify Pause Updates
spicetify spotify-updates block 