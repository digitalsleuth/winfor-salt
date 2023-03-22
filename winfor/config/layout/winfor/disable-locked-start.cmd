@echo off
setlocal EnableDelayedExpansion
title Disable Locked Start Layout
%1 %2 mshta vbscript:createobject("shell.application").shellexecute("%~s0","goto :runas","","runas",1)(window.close)&goto :eof
:runas
echo Forcing update of GPO
gpupdate /force
timeout /t 3 /nobreak 1>nul
echo Disabling locked start menu layout
reg add HKLM\SOFTWARE\Policies\Microsoft\Windows\Explorer /v LockedStartLayout /t REG_DWORD /d 0 /f 1>nul & reg add HKCU\SOFTWARE\Policies\Microsoft\Windows\Explorer /v LockedStartLayout /t REG_DWORD /d 0 /f 1>nul
echo Restarting Explorer...
timeout /t 1 /nobreak 1>nul
taskkill /F /IM explorer.exe & start explorer
echo Finished
exit
