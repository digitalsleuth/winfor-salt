# Name: Windows Terminal
# Website: https://github.com/microsoft/terminal
# Description: Terminal Emulator
# Category: Terminals
# Author: Microsoft
# License: MIT License (https://github.com/microsoft/terminal/blob/main/LICENSE)
# Version: 1.16.(10261|10262).0
# Notes: 

{% set release_ver = '1.16.10261.0' %}
{% set user = salt['pillar.get']('winfor_user', 'forensics') %}
{% set release = grains['osrelease'] %}
{% if release == '11' %}
  {% set version = '1.16.10262.0' %}
{% elif release == '10' %}
  {% set version = '1.16.10261.0' %}
{% endif %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

windows-terminal:
  file.managed:
    - name: 'C:\salt\tempdownload\Microsoft.WindowsTerminal_Win{{ release }}_{{ version }}_8wekyb3d8bbwe.msixbundle'
    - source: https://github.com/microsoft/terminal/releases/download/v{{ release_ver }}/Microsoft.WindowsTerminal_Win{{ release }}_{{ version }}_8wekyb3d8bbwe.msixbundle
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
    - target: 'C:\Program Files\WindowsApps\Microsoft.WindowsTerminal_{{ version }}_x64__8wekyb3d8bbwe\wt.exe'
    - force: True
    - working_dir: 'C:\Program Files\WindowsApps\Microsoft.WindowsTerminal_{{ version }}_x64__8wekyb3d8bbwe\'
    - makedirs: True
    - require:
      - file: windows-terminal
      - cmd: windows-terminal-install
