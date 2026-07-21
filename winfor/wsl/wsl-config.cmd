@echo off
setlocal
title WIN-FOR WSL Config
net session >nul 2>&1
if %errorlevel% neq 0 (
    powershell -NoProfile -ExecutionPolicy Bypass -Command "Start-Process -FilePath '%~f0' -Verb RunAs"
    exit /b
)
powershell -f C:\salt\tempdownload\wsl-after-reboot.ps1
