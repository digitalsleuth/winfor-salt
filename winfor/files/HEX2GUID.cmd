@echo off
TITLE GUID HEX CONVERTER
::CMPFOR Special 22-01
::v.20220505a
::Sgt. Mark Southby
::clear choice variable
TITLE HEX to VOLUME GUID for GPT partitioned Drives
set choice=0
::Display text
:choice
cls
ECHO You find the HEX needed to calculate the GPT GUID at
ECHO Sector 0, Offset 56 fot 16 Bytes.
ECHO To Calclude the (G)UID, go get this hex.
ECHO If you have a GUID and want to know what the (H)ex is, copy that from
ECHO HKLM\Systen\MountedDevices   registry 
ECHO.
ECHO Make a selection
ECHO (H)EX to GPT Volume GUID
ECHO GPT Volume (G)UID to HEX (Sector 0 Offset 56)
ECHO (Q)uit

::Wait for choice
set /p choice=:
:: Check selection, if h or H go to hex, if G or g go to GUID, otherwise say invalid selection and re-ask question
IF %choice%==g GOTO G2H
IF %choice%==G GOTO G2H
IF %choice%==h GOTO H2G
IF %choice%==H GOTO H2G
IF %choice%==q GOTO quit
IF %choice%==Q GOTO quit
echo INVALID SELECTION
pause
goto choice

::Code for GUID to HEX
:G2H
color e8
Title GUID to HEX
set /p g=Paste GUID with brackets (Right click here):
echo.
echo Your RAW HEX is
echo %g:~7,2%%g:~5,2%%g:~3,2%%g:~1,2%%g:~12,2%%g:~10,2%%g:~17,2%%g:~15,2%%g:~20,4%%g:~25,12%
echo.
echo select and right click to copy.
pause
goto choice
::Code for HEX to GUID
:H2G
color 8e
Title HEX to GUID
set /p x=Paste HEX (Right click here):
echo.
echo Your GUID is
echo {%x:~6,2%%x:~4,2%%x:~2,2%%x:~0,2%-%x:~10,2%%x:~8,2%-%x:~14,2%%x:~12,2%-%x:~16,4%-%x:~20,14%}
echo.
echo select and right click to copy.
pause
goto choice

:quit