@echo off
::CMPFOR Script created by Sgt. Mark Southby
::2023-03-03
:: Rename your version of exiftool(-k)-#.#.exe to exiftool.exe
::Click and Drag folder with images and videos
::to folder containing exiftool.exe and kml.fmt

::Set the output filename before the .kml
set version=1.0.2
TITLE EXIF KML Generator v%version%
set /p filename=Enter your desired KML File Name (without extension):
set orig=%filename%
::Set Path to photos
ECHO Click and drag photos folder to this window and press Enter.
SET /p output=:
::Check to see if output name exists
IF EXIST %output%\"%filename%.KML" goto exists
::If not found, use existing name
GOTO unique
:exists
::If it exists add an increment
set /a incr=%incr%+1
::set filename=%filename%-%incr%
::Check to see if file and increment exists
IF EXIST %output%\"%filename%-%incr%.KML" goto exists
::Reference original file exists, display updated filename
set filename=%filename%-%incr%
echo %orig%.KML exists at %output:"=%

:unique
echo Output will be "%output:"=%\%filename%.KML"
:: Run EXIFTool Command
PLACEHOLDER_PATH\exiftool\exiftool -ee3 -m -n -r -q -p PLACEHOLDER_PATH\exiftool\kml.fmt %output%>%output%\"%filename%.KML"
echo.
set incr=0
pause
