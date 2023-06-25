# Name: Windows Terminal
# Website: https://github.com/microsoft/terminal
# Description: Terminal Emulator
# Category: Terminals
# Author: Microsoft
# License: MIT License (https://github.com/microsoft/terminal/blob/main/LICENSE)
# Version: 1.17.11461.0
# Notes: 

{% set version = '1.17.11461.0' %}
{% set user = salt['pillar.get']('winfor_user', 'forensics') %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

windows-terminal-download-only:
  file.managed:
    - name: '{{ downloads }}\Microsoft.WindowsTerminal_{{ version }}_8wekyb3d8bbwe.msixbundle'
    - source: https://github.com/microsoft/terminal/releases/download/v{{ version }}/Microsoft.WindowsTerminal_{{ version }}_8wekyb3d8bbwe.msixbundle
    - skip_verify: True
    - makedirs: True
