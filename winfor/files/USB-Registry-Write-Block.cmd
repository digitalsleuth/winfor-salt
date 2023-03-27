:: USB WRITEBLOCKER - CMPFOR EDITION
:: Version 2.211214a
@echo off
set ver=2.211214a
:: Original R&D and batch script writen by Sergeant Crey Forman of DND. (Version 1.2) 
:: Please visit https://github.com/digitalsleuth/ for more details.
::=========================================================================
:: This code has been modified to add the following features:
:: - looped to allow enable and disable without relaunching
:: - changed colour to show RED is writeblocked GREEN is read-write/normal
:: - changed TITLE to show if Write Protection is ON or OFF
:: - Added Automatic privilege escalation to ensure run with administrator rights if the account has admin
:: - Changed Error code
:: Sgt. Mark Southby, Canadian Police College Tech Crime Learning Institute
::=========================================================================
::Privilege Escalation to Admin shell in same path not System32 as most rightclick-runasadmin does.
@setlocal enableextensions
::saving path - ms
@cd /d "%~dp0
if _%1_==_payload_  goto :payload
:getadmin
    echo %~nx0: ELEVATING TO ADMINISTRATOR PROMPT...
    set vbs=%temp%\getadmin.vbs
    echo Set UAC = CreateObject^("Shell.Application"^)                >> "%vbs%"
    echo UAC.ShellExecute "%~s0", "payload %~sdp0 %*", "", "runas", 1 >> "%vbs%"
    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
goto :eof
:payload

:: Query Registry value and display if write blocker enabled or disabled - ms
:start
::Set choice as q, so if no letter typed it quits - ms
:: Query if key exists. If it does, Writeprotection was left enabled, if missing then should be normal. -ms
set choice=Q
reg query HKLM\SYSTEM\CurrentControlSet\Control\Storage\EnabledDenyGP\{53F5630D-B6BF-11D0-94F2-00A0C91EFB8B} >nul
if %errorlevel% equ 0 (
	COLOR 04 
	CLS
	ECHO USB ACCESS IS WRITE PROTECTED - READ-ONLY
	TITLE USB WRITE BLOCKER - ENABLED   [%ver%]
) else (
	COLOR 0A
	CLS
	ECHO USB ACCESS IS NORMAL - READ/WRITE
	TITLE USB WRITE BLOCKER - DISABLED   [%ver%]
)
::##MS##::=========================================================================
::TITLE Registry USB Write Blocker - v1.2 - original code -ms 
::ECHO Registry USB Write Blocker - v1.2 - original code -ms 
ECHO.
ECHO.
ECHO This tool will allow you to enable and disable write-blocking
ECHO of USB devices using Registry keys in 
ECHO SOFTWARE\Policies\Microsoft\Windows\RemovableStorageDevices and
ECHO SYSTEM\CurrentControlSet\Control\
ECHO -------------------------------------------------------------------
ECHO Please open this batch file in a text editor to verify which keys are modified.
ECHO -------------------------------------------------------------------
ECHO.
ECHO E - Enable USB Write Blocking
ECHO.
ECHO D - Disable USB Write Blocking
ECHO.
ECHO Q - Quit this script
ECHO.  

set /p choice="Write-Blocking options: [D]isable,[E]nable,[Q]uit: "
if /I "%choice%"=="Q" goto quit
if /I "%choice%"=="E" goto enable
if /I "%choice%"=="D" goto disable
goto error
:error
color 4e
ECHO Please select only letter in brackets: [D],[E] or [Q]uit.
pause
goto start

:enable
reg add HKLM\SOFTWARE\Policies\Microsoft\Windows\RemovableStorageDevices /f
reg add HKLM\SOFTWARE\Policies\Microsoft\Windows\RemovableStorageDevices\{53f5630d-b6bf-11d0-94f2-00a0c91efb8b} /v Deny_Write /t REG_DWORD /d 1 /f
reg add HKLM\SOFTWARE\Policies\Microsoft\Windows\RemovableStorageDevices\{53f56307-b6bf-11d0-94f2-00a0c91efb8b} /v Deny_Write /t REG_DWORD /d 1 /f
reg add HKLM\SOFTWARE\Policies\Microsoft\Windows\RemovableStorageDevices\Custom /f
reg add HKLM\SOFTWARE\Policies\Microsoft\Windows\RemovableStorageDevices\Custom\Deny_Write /f
reg add HKLM\SOFTWARE\Policies\Microsoft\Windows\RemovableStorageDevices\Custom\Deny_Write /v Deny_Write /t REG_DWORD /d 1 /f
reg add HKLM\SOFTWARE\Policies\Microsoft\Windows\RemovableStorageDevices\Custom\Deny_Write\List /f
reg add HKLM\SOFTWARE\Policies\Microsoft\Windows\RemovableStorageDevices\Custom\Deny_Write\List /v "{53f5630d-b6bf-11d0-94f2-00a0c91efb8b}" /d "{53f5630d-b6bf-11d0-94f2-00a0c91efb8b}" /f
reg add HKLM\SOFTWARE\Policies\Microsoft\Windows\RemovableStorageDevices\Custom\Deny_Write\List /v "{53f56307-b6bf-11d0-94f2-00a0c91efb8b}" /d "{53f56307-b6bf-11d0-94f2-00a0c91efb8b}" /f
reg add HKLM\SYSTEM\CurrentControlSet\Control\StorageDevicePolicies /v WriteProtect /t REG_DWORD /d 1 /f
reg add HKLM\SYSTEM\CurrentControlSet\Control\Storage\EnabledDenyGP /v DenyAllGPState /t REG_DWORD /d 1 /f
reg add HKLM\SYSTEM\CurrentControlSet\Control\Storage\EnabledDenyGP\{53F5630D-B6BF-11D0-94F2-00A0C91EFB8B} /v EnumerateDevices /t REG_DWORD /d 1 /f
reg add HKLM\SYSTEM\CurrentControlSet\Control\Storage\EnabledDenyGP\{53F5630D-B6BF-11D0-94F2-00A0C91EFB8B} /v AccessBitMask /t REG_DWORD /d 0 /f
reg add HKLM\SYSTEM\CurrentControlSet\Control\Storage\EnabledDenyGP\{53F5630D-B6BF-11D0-94F2-00A0C91EFB8B} /v UserPolicy /t REG_DWORD /d 0 /f
reg add HKLM\SYSTEM\CurrentControlSet\Control\Storage\EnabledDenyGP\{53F5630D-B6BF-11D0-94F2-00A0C91EFB8B} /v AuditPolicyOnly /t REG_DWORD /d 0 /f
reg add HKLM\SYSTEM\CurrentControlSet\Control\Storage\EnabledDenyGP\{53F5630D-B6BF-11D0-94F2-00A0C91EFB8B} /v SecurityDescriptor /t REG_SZ /d "D:(D;;DCLCRPCRSD;;;IU)(A;;FA;;;SY)(A;;FA;;;LS)(A;;0x1200a9;;;IU)" /f
reg add HKLM\SYSTEM\CurrentControlSet\Control\Storage /v HotplugSecurityDescriptor /t REG_BINARY /d "01000480000000000000000000000000140000000200580004000000010014001601010001010000000000050400000000001400ff011f0001010000000000051200000000001400ff011f0001010000000000051300000000001400a9001200010100000000000504000000" /f
::goto quit - original code -ms 
ECHO USB WRITEBLOCK ENABLED
ECHO PLUG IN USB DEVICE FOR READ-ONLY ACCESS
:: Added loop - ms
goto start

:disable
reg delete HKLM\SOFTWARE\Policies\Microsoft\Windows\RemovableStorageDevices /f
reg delete HKLM\SYSTEM\CurrentControlSet\Control\Storage\EnabledDenyGP\{53F5630D-B6BF-11D0-94F2-00A0C91EFB8B} /f
reg add HKLM\SYSTEM\CurrentControlSet\Control\StorageDevicePolicies /v WriteProtect /t REG_DWORD /d 0 /f
reg delete HKLM\SYSTEM\CurrentControlSet\Control\Storage /v HotplugSecurityDescriptor /f
::goto quit  original code -ms 
ECHO USB WRITEBLOCK DISABLED
ECHO YOU CAN NOW READ AND WRITE TO USB DEVICES
:: Added loop - ms
goto start
:quit
color 0f
