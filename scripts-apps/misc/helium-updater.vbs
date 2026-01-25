Set WshShell = CreateObject("WScript.Shell")
WshShell.Run "cmd.exe /c winget update helium --silent", 0, False
