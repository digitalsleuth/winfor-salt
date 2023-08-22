# Name: WinDbg
# Website: https://www.microsoft.com
# Description: Windows Debugger
# Category: Executables
# Author: Microsoft
# License: Third-party Notices within app
# Version: 1.2308.2002.0
# Notes: 

{% set version = '1.2308.2002.0' %}
{% set hash = '25195d02c40a3496053fec728de833275559534e30b18fa206e5182ca0dd78e8' %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set PROGRAM_FILES = salt['environ.get']('PROGRAMFILES') %}
{% set LOCALAPPDATA = salt['environ.get']('LOCALAPPDATA') %}

windbg-download:
  file.managed:
    - name: 'C:\salt\tempdownload\windbg.appinstaller'
    - source: https://windbg.download.prss.microsoft.com/dbazure/prod/1-0-0/windbg.appinstaller
    - source_hash: sha256={{ hash }}
    - makedirs: True

windbg-install:
  cmd.run:
    - name: 'Add-AppxPackage -AppInstallerFile C:\salt\tempdownload\windbg.appinstaller'
    - shell: powershell
    - require:
      - file: windbg-download

windbg-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\WinDbg.lnk'
    - target: '{{ LOCALAPPDATA }}\Microsoft\WindowsApps\WinDbgX.exe'
    - force: True
    - working_dir: '{{ LOCALAPPDATA }}\Microsoft\WindowsApps\'
    - icon_location: '{{ PROGRAM_FILES }}\WindowsApps\Microsoft.WinDbg_{{ version }}_x64__8wekyb3d8bbwe\DbgX.Shell.exe'
    - require:
      - cmd: windbg-install
