# Name: Win-FOR Customizer
# Website: https://github.com/digitalsleuth/win-for
# Description: GUI for the installation of Forensics Tools in a Windows Environment
# Category: Utilities
# Author: Corey Forman (digitalsleuth)
# License: MIT (https://github.com/digitalsleuth/WIN-FOR/blob/main/LICENSE)
# Version: 10.0.0
# Notes: 

{% set version = '10.0.0' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

winfor-customizer-download-only:
  file.managed:
    - name: '{{ downloads }}\winfor-customizer\winfor-customizer-v{{ version }}.exe'
    - source: https://github.com/digitalsleuth/WIN-FOR/releases/download/v{{ version }}/winfor-customizer-v{{ version }}.exe
    - skip_verify: True
    - makedirs: True
    - replace: False
