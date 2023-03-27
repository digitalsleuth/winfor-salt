@setlocal enableextensions
@cd /d "%~dp0
@echo off
:one
if _%1_==_payload_  goto :payload

:getadmin
    echo %~nx0: elevating self
    set vbs=%temp%\getadmin.vbs
    echo Set UAC = CreateObject^("Shell.Application"^)                >> "%vbs%"
    echo UAC.ShellExecute "%~s0", "payload %~sdp0 %*", "", "runas", 1 >> "%vbs%"
    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
goto :eof

:payload
:: ######################################################
:: VERSION 0.9.121221a - December 21 2012 Apocolypse Edition
:: SCRIPT: GETSYSTEM
:: CREATION DATE: 2011-05-26
:: LAST MODIFIED: 2021-04-08
:: AUTHOR: Mark SOUTHBY
:: EMAIL: mark@southby.ca
:: ######################################################
:: DESCRIPTION: Privledge escalation to NT AUTHORITY\SYSTEM
:: START OF BATCH
!!psexec -i -s -d cmd /noeula
if %errorlevel% == 1 (goto error) else (goto launched)
:error
color 0c
echo ===================================

echo     If the above error says 
echo       "Access is denied."
echo               or
echo  '!!psexec' is not recognized as an internal or external command,
echo. 
echo. 
echo  This is because this tool needs to be run from an 
echo  Administrator privledged command prompt.
echo.
echo  To run command prompt as an Administrator
echo  in Windows 7-10, press the windows key, type
echo  "cmd" and then press control-shift-enter.
gotoexit

:launched
color 0a
cls
echo Launch Successful
echo.
echo In the new command prompt go to
cd |findstr :
echo And lauch REGDUMP to dump protected registry files
echo.
echo Or TEA to run TEA with no permission issues
echo.
echo.
:eof
:exit
pause
