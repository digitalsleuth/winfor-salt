@echo off
setlocal EnableDelayedExpansion
title WIN-FOR WSL Config
%1 %2 mshta vbscript:createobject("shell.application").shellexecute("%~s0","goto :runas","","runas",1)(window.close)&goto :eof
:runas
echo $saltArgs = "-l debug --local --retcode-passthrough --log-file=`"C:\winfor-wsl.log`" --log-file-level=debug --out-file=`"C:\winfor-wsl.log`" --out-file-append --state-output=mixed state.sls winfor.wsl.wsl-config pillar=`"{'winfor_user': '_this_user_'}`""> C:\salt\tempdownload\wsl-after-reboot.ps1
echo $repoLogFile = ("C:\" + ((Get-Item C:\winfor-saltstack-*.log ^| sort) ^| Select -Last 1).Name) >> C:\salt\tempdownload\wsl-after-reboot.ps1
type "C:\ProgramData\Salt Project\Salt\srv\salt\winfor\wsl\wsl.ps1" >> C:\salt\tempdownload\wsl-after-reboot.ps1
powershell -f C:\salt\tempdownload\wsl-after-reboot.ps1
