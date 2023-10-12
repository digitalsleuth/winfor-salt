# Name: Win-FOR Customizer
# Website: https://github.com/digitalsleuth/win-for
# Description: GUI for the installation of Forensics Tools in a Windows Environment
# Category: Utilities
# Author: Corey Forman (digitalsleuth)
# License: MIT (https://github.com/digitalsleuth/WIN-FOR/blob/main/LICENSE)
# Version: 8.4.0
# Notes: 

{% set version = '8.4.0' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set hash = '84e47d9f886f5edf4a1836181a118b2cadf20a1fa73493a4201f80b031d75ac7' %}

winfor-customizer-download-only:
  file.managed:
    - name: '{{ downloads }}\winfor-customizer\winfor-customizer-v{{ version }}.exe'
    - source: https://github.com/digitalsleuth/WIN-FOR/releases/download/v{{ version }}/winfor-customizer-v{{ version }}.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
    - replace: False
