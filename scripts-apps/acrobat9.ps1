# download acrobat
$URL = "https://github.com/mespp/utilities-win/releases/download/apps/Adobe.Acrobat.9.Standard.iso"
$AppsFolder = Join-Path -Path $PSScriptRoot -ChildPath "apps"

if (-not (Test-Path $AppsFolder)) { New-Item -ItemType Directory -Path $AppsFolder | Out-Null }
cd $AppsFolder

Start-Process -FilePath "curl.exe" -ArgumentList "-L -O $URL" -Wait

# mount and install acrobat
$IsoPath = Join-Path -Path $AppsFolder -ChildPath "Adobe.Acrobat.9.Standard.iso"
$MountResult = Mount-DiskImage -ImagePath $IsoPath -PassThru
$DriveLetter = ($MountResult | Get-Volume).DriveLetter

if ($DriveLetter) {
    $InstallPath = "$($DriveLetter):\AutoPlay.exe"
    Start-Process -FilePath $InstallPath -Wait
}

# show .txt with key
cd ..
Start-Process notepad.exe misc/key-acrobat9.txt
