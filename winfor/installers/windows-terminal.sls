# Name: Windows Terminal
# Website: https://github.com/microsoft/terminal
# Description: Terminal Emulator
# Category: Terminals
# Author: Microsoft
# License: MIT License (https://github.com/microsoft/terminal/blob/main/LICENSE)
# Version: 1.15.3465.0
# Notes: 

# Alternate install method supposed to work for all users, but doesn't yet:
# DISM.EXE /Online /Add-ProvisionedAppxPackage /PackagePath:Microsoft.WindowsTerminal_1.11.3471.0_8wekyb3d8bbwe.msixbundle /SkipLicense

{% set user = salt['pillar.get']('winfor_user', 'forensics') %}
{% set version = '1.15.3465.0' %}
{% set release = grains['osrelease'] %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

windows-terminal:
  file.managed:
    - name: 'C:\salt\tempdownload\Microsoft.WindowsTerminal_Win{{ release }}_{{ version }}_8wekyb3d8bbwe.msixbundle'
    - source: https://github.com/microsoft/terminal/releases/download/v{{ version }}/Microsoft.WindowsTerminal_Win{{ release }}_{{ version }}_8wekyb3d8bbwe.msixbundle
    - skip_verify: True
    - makedirs: True

windows-terminal-install:
  cmd.run:
    - name: "dism /Online /Add-ProvisionedAppxPackage /PackagePath:Microsoft.WindowsTerminal_Win{{ release }}_{{ version }}_8wekyb3d8bbwe.msixbundle /SkipLicense"
    - shell: cmd
    - cwd: 'C:\salt\tempdownload\'

windows-terminal-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\Terminal.lnk'
    - target: 'C:\Program Files\WindowsApps\Microsoft.WindowsTerminal_1.15.3465.0_x64__8wekyb3d8bbwe\wt.exe'
    - force: True
    - working_dir: 'C:\Program Files\WindowsApps\Microsoft.WindowsTerminal_1.15.3465.0_x64__8wekyb3d8bbwe\'
    - makedirs: True
    - require:
      - file: windows-terminal
      - cmd: windows-terminal-install
