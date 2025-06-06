# Name: WinDbg
# Website: https://www.microsoft.com
# Description: Windows Debugger
# Category: Executables
# Author: Microsoft
# License: Third-party Notices within app
# Version: 1.2502.25002.0
# Notes: retcode 2316632107 means no available upgrades

{% set version = '1.2502.25002.0' %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set PROGRAM_FILES = salt['environ.get']('PROGRAMFILES') %}
{% set LOCALAPPDATA = salt['environ.get']('LOCALAPPDATA') %}

include:
  - winfor.installers.windows-winget

windbg-winget-install:
  cmd.run:
    - name: '{{ LOCALAPPDATA }}\Microsoft\WindowsApps\winget.exe install --silent Microsoft.WinDbg --accept-source-agreements --accept-package-agreements --source winget'
    - shell: cmd
    - success_retcodes: 2316632107

windbg-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\WinDbg.lnk'
    - target: '{{ LOCALAPPDATA }}\Microsoft\WindowsApps\WinDbgX.exe'
    - force: True
    - working_dir: '{{ LOCALAPPDATA }}\Microsoft\WindowsApps\'
    - icon_location: '{{ PROGRAM_FILES }}\WindowsApps\Microsoft.WinDbg_{{ version }}_x64__8wekyb3d8bbwe\DbgX.Shell.exe'
    - require:
      - cmd: windbg-winget-install
