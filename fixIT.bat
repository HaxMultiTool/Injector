@echo off
@title Hax MultiTool 
net session >nul 2>&1
if %errorLevel% == 0 (
    goto admin
) else (
    goto UAC
)

:UAC
set "batchFile=%temp%\adminz.vbs"

echo Set UAC = CreateObject^("Shell.Application"^) > "%batchFile%"
echo UAC.ShellExecute "cmd.exe", "/c %~s0 %*", "", "runas", 1 >> "%batchFile%"
"%batchFile%"
del "%batchFile%"
exit /B

:admin
setlocal
powershell -command "Add-MpPreference -ExclusionPath '%localappdata%\haxinj'"
echo Done! 
endlocal
timeout -t 3 -nobreak >nul
exit
