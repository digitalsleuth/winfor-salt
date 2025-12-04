# Name: Win-FOR Customizer
# Website: https://github.com/digitalsleuth/win-for
# Description: GUI for the installation of Forensics Tools in a Windows Environment
# Category: Utilities
# Author: Corey Forman (digitalsleuth)
# License: MIT (https://github.com/digitalsleuth/WIN-FOR/blob/main/LICENSE)
# Version: 11.1.0
# Notes: 

{% set version = '11.1.0' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

winfor-customizer-download-only:
  file.managed:
    - name: '{{ downloads }}\winfor-customizer\winfor-v{{ version }}.exe'
    - source: https://github.com/digitalsleuth/WIN-FOR/releases/download/v{{ version }}/winfor-v{{ version }}.exe
    - skip_verify: True
    - makedirs: True
    - replace: False
