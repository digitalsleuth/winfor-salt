# Name: Windows Terminal
# Website: https://github.com/microsoft/terminal
# Description: Terminal Emulator
# Category: Terminals
# Author: Microsoft
# License: MIT License (https://github.com/microsoft/terminal/blob/main/LICENSE)
# Version: 1.19.10302.0
# Notes: 

{% set version = '1.19.10302.0' %}
{% set user = salt['pillar.get']('winfor_user', 'forensics') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

windows-terminal:
  file.managed:
    - name: 'C:\salt\tempdownload\Microsoft.WindowsTerminal_{{ version }}_8wekyb3d8bbwe.msixbundle'
    - source: https://github.com/microsoft/terminal/releases/download/v{{ version }}/Microsoft.WindowsTerminal_{{ version }}_8wekyb3d8bbwe.msixbundle
    - skip_verify: True
    - makedirs: True

windows-terminal-install:
  cmd.run:
    - name: "dism /Online /Add-ProvisionedAppxPackage /PackagePath:Microsoft.WindowsTerminal_{{ version }}_8wekyb3d8bbwe.msixbundle /SkipLicense"
    - shell: cmd
    - cwd: 'C:\salt\tempdownload\'

windows-terminal-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\Terminal.lnk'
    - target: 'C:\Program Files\WindowsApps\Microsoft.WindowsTerminal_{{ version }}_x64__8wekyb3d8bbwe\wt.exe'
    - force: True
    - working_dir: 'C:\Program Files\WindowsApps\Microsoft.WindowsTerminal_{{ version }}_x64__8wekyb3d8bbwe\'
    - makedirs: True
    - require:
      - file: windows-terminal
      - cmd: windows-terminal-install
