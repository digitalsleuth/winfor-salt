# Name: Windows Terminal
# Website: https://github.com/microsoft/terminal
# Description: Terminal Emulator
# Category: Terminals
# Author: Microsoft
# License: MIT License (https://github.com/microsoft/terminal/blob/main/LICENSE)
# Version: 1.22.11141.0
# Notes: 

{% set version = '1.22.11141.0' %}
{% set user = salt['pillar.get']('winfor_user', 'forensics') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set TERMINAL_VERSION = salt['cmd.run']('powershell -c "(Get-AppxPackage -Name Microsoft.WindowsTerminal).Version"') %}
{% set TERMINAL_PKG = salt['cmd.run']('powershell -c "(Get-AppxPackage -Name Microsoft.WindowsTerminal).PackageFullName"') %}

{% if TERMINAL_PKG != '' %}
Microsoft Terminal is installed - checking if upgrade required:
  test.nop

{% if TERMINAL_VERSION.split('.') | map('int') | list >= version.split('.') | map('int') | list %}
Selected version is lower than the installed version - not replacing existing Microsoft Terminal:
  test.nop

{% else %}
Selected version is higher than the installed version - removing and upgrading Microsoft Terminal:
  test.nop

windows-terminal-remove-existing:
  cmd.run:
    - name: "Remove-AppxPackage -Package {{ TERMINAL_PKG }} -AllUsers"
    - shell: powershell

windows-terminal-bundle-upgrade:
  file.managed:
    - name: 'C:\salt\tempdownload\Microsoft.WindowsTerminal_{{ version }}_8wekyb3d8bbwe.msixbundle'
    - source: https://github.com/microsoft/terminal/releases/download/v{{ version }}/Microsoft.WindowsTerminal_{{ version }}_8wekyb3d8bbwe.msixbundle
    - skip_verify: True
    - makedirs: True
    - require:
      - cmd: windows-terminal-remove-existing

windows-terminal-install-upgrade:
  cmd.run:
    - name: 'dism /online /quiet /norestart /Add-ProvisionedAppxPackage /PackagePath:Microsoft.WindowsTerminal_{{ version }}_8wekyb3d8bbwe.msixbundle /SkipLicense'
    - shell: cmd
    - success_retcodes: 3010
    - cwd: 'C:\salt\tempdownload\'

windows-terminal-shortcut-upgrade:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\Terminal.lnk'
    - target: 'C:\Program Files\WindowsApps\Microsoft.WindowsTerminal_{{ version }}_x64__8wekyb3d8bbwe\wt.exe'
    - force: True
    - working_dir: 'C:\Program Files\WindowsApps\Microsoft.WindowsTerminal_{{ version }}_x64__8wekyb3d8bbwe\'
    - makedirs: True
    - require:
      - file: windows-terminal-bundle-upgrade
      - cmd: windows-terminal-install-upgrade

{% endif %}
{% else %}
Microsoft Terminal is not installed - installing:
  test.nop

windows-terminal-bundle-new:
  file.managed:
    - name: 'C:\salt\tempdownload\Microsoft.WindowsTerminal_{{ version }}_8wekyb3d8bbwe.msixbundle'
    - source: https://github.com/microsoft/terminal/releases/download/v{{ version }}/Microsoft.WindowsTerminal_{{ version }}_8wekyb3d8bbwe.msixbundle
    - skip_verify: True
    - makedirs: True

windows-terminal-install-new:
  cmd.run:
    - name: 'dism /online /quiet /norestart /Add-ProvisionedAppxPackage /PackagePath:Microsoft.WindowsTerminal_{{ version }}_8wekyb3d8bbwe.msixbundle /SkipLicense'
    - shell: cmd
    - success_retcodes: 3010
    - cwd: 'C:\salt\tempdownload\'

windows-terminal-shortcut-new:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\Terminal.lnk'
    - target: 'C:\Program Files\WindowsApps\Microsoft.WindowsTerminal_{{ version }}_x64__8wekyb3d8bbwe\wt.exe'
    - force: True
    - working_dir: 'C:\Program Files\WindowsApps\Microsoft.WindowsTerminal_{{ version }}_x64__8wekyb3d8bbwe\'
    - makedirs: True
    - require:
      - file: windows-terminal-bundle-new
      - cmd: windows-terminal-install-new
{% endif %}

