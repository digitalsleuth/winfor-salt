# Name: Windows Terminal
# Website: https://github.com/microsoft/terminal
# Description: Terminal Emulator
# Category: Terminals
# Author: Microsoft
# License: MIT License (https://github.com/microsoft/terminal/blob/main/LICENSE)
# Notes: 
# Version: 1.11.3471.0

# Alternate install method supposed to work for all users, but doesn't yet:
# DISM.EXE /Online /Add-ProvisionedAppxPackage /PackagePath:Microsoft.WindowsTerminal_1.11.3471.0_8wekyb3d8bbwe.msixbundle /SkipLicense

{% set user = salt['pillar.get']('winfor_user', 'forensics') %}
{% set version = '1.11.3471.0' %}
{% set hash = '8d4aa2585e62cdd5a1c8c3c5ed4f482f5029eace4777d247a3c728538f126f6a' %}

windows-terminal:
  file.managed:
    - name: C:\\salt\\tempdownload\\Microsoft.WindowsTerminal_{{ version }}_8wekyb3d8bbwe.msixbundle
    - source: https://github.com/microsoft/terminal/releases/download/v{{ version }}/Microsoft.WindowsTerminal_{{ version }}_8wekyb3d8bbwe.msixbundle
    - source_hash: sha256={{ hash }}
    - makedirs: True

windows-terminal-install:
  cmd.run:
    - name: "Add-AppxPackage -Path C:\\salt\\tempdownload\\Microsoft.WindowsTerminal_{{ version }}_8wekyb3d8bbwe.msixbundle"
    - shell: powershell

windows-terminal-remove-alias:
  file.absent:
    - name: 'C:\Users\{{ user }}\AppData\Local\Microsoft\WindowsApps\wt.exe'
