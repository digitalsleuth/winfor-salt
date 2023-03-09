# Name: WinDbg
# Website: https://www.microsoft.com
# Description: Windows Debugger
# Category: Executables
# Author: Microsoft
# License: Third-party Notices within app
# Version: 1.2210.3001.0
# Notes: Installed via winget

{% set version = '1.2210.3001.0' %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set PROGRAM_FILES = salt['environ.get']('PROGRAMFILES') %}
{% set WINDIR = salt['environ.get']('WINDIR') %}
{% set LOCALAPPDATA = salt['environ.get']('LOCALAPPDATA') %}
{% set WINGET = LOCALAPPDATA + "\\Microsoft\\WindowsApps\\winget.exe" %}

include:
  - winfor.installers.windows-winget

windbg-install:
  cmd.run:
    - name: $installWindbg = ({{ WINGET }} install windbg --accept-source-agreements --accept-package-agreements)
    - shell: powershell
    - unless:
      - fun: cmd.run
        cmd: $isInstalled = ({{ WINGET }} uninstall windbg --accept-source-agreements); if ($LASTEXITCODE -ne 0) {exit 0}
        shell: powershell
        python_shell: True
    - require:
      - sls: winfor.installers.windows-winget

windbg-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\WinDbg Preview.lnk'
    - target: '{{ WINDIR }}\explorer.exe'
    - arguments: 'shell:appsfolder\Microsoft.WinDbg_8wekyb3d8bbwe!Microsoft.WinDbg'
    - force: True
    - working_dir: '{{ WINDIR }}\'
    - icon_location: '{{ PROGRAM_FILES }}\WindowsApps\Microsoft.WinDbg_{{ version }}_x64__8wekyb3d8bbwe\DbgX.Shell.exe'
    - require:
      - cmd: windbg-install
