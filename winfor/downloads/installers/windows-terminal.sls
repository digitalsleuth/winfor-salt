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
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

windows-terminal-download-only:
  file.managed:
    - name: '{{ downloads }}\Microsoft.WindowsTerminal_Win{{ release }}_{{ version }}_8wekyb3d8bbwe.msixbundle'
    - source: https://github.com/microsoft/terminal/releases/download/v{{ release_ver }}/Microsoft.WindowsTerminal_Win{{ release }}_{{ version }}_8wekyb3d8bbwe.msixbundle
    - skip_verify: True
    - makedirs: True
