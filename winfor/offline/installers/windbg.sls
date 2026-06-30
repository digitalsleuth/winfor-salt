# Name: WinDbg
# Website: https://www.microsoft.com
# Description: Windows Debugger
# Category: Executables
# Author: Microsoft
# License: Third-party Notices within app
# Version: 1.2603.20001.0
# Notes: retcode 2316632107 means no available upgrades

{% set version = '1.2603.20001.0' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set PROGRAM_FILES = salt['environ.get']('PROGRAMFILES') %}
{% set LOCALAPPDATA = salt['environ.get']('LOCALAPPDATA') %}
{% set pkg = 'windbg-'~ version ~'.msixbundle' %}
{% set exists = salt['file.file_exists'](downloads + '\\windbg\\' + pkg) %}

{% if exists %}

windbg-install-offline:
  cmd.run:
    - name: 'Add-AppPackage -Path {{ downloads }}\windbg\{{ pkg }}'
    - shell: powershell

windbg-shortcut-offline:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\WinDbg.lnk'
    - target: '{{ LOCALAPPDATA }}\Microsoft\WindowsApps\WinDbgX.exe'
    - force: True
    - working_dir: '{{ LOCALAPPDATA }}\Microsoft\WindowsApps\'
    - icon_location: '{{ PROGRAM_FILES }}\WindowsApps\Microsoft.WinDbg_{{ version }}_x64__8wekyb3d8bbwe\DbgX.Shell.exe'
    - require:
      - cmd: windbg-install-offline

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
