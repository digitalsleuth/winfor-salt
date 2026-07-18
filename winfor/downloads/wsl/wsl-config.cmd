@echo off
setlocal EnableDelayedExpansion
title WIN-FOR WSL Config
%1 %2 mshta vbscript:createobject("shell.application").shellexecute("%~s0","goto :runas","","runas",1)(window.close)&goto :eof
:runas
powershell -f C:\salt\tempdownload\wsl-after-reboot.ps1
