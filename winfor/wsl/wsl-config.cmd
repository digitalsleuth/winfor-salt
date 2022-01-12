@echo off
setlocal EnableDelayedExpansion
title WIN-FOR WSL Config
%1 %2 mshta vbscript:createobject("shell.application").shellexecute("%~s0","goto :runas","","runas",1)(window.close)&goto :eof
:runas
salt-call -l debug --local --retcode-passthrough --log-file="C:\salt\tempdownload\saltstack.log" --log-file-level=debug --out-file="C:\salt\tempdownload\saltstack.log" --out-file-append --state-output=mixed state.sls winfor.wsl.wsl-config pillar="{'winfor_user': '_this_user_'}"
echo WSL Configuration Complete
exit
