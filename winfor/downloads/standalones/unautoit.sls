# Name: UnAutoIt
# Website: https://github.com/digitalsleuth/UnAutoIt
# Description: AutoIt extractor
# Category: Installers
# Author: Corey Forman (digitalsleuth) / x0r19x91
# License: GNU General Public License v3 (https://github.com/digitalsleuth/UnAutoIt/blob/main/LICENSE)
# Version: 1.1.1
# Notes: 

{% set version = '1.1.1' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('unautoit') %}

unautoit-download-only:
  file.managed:
    - name: '{{ downloads }}\unautoit\unautoit-{{ version }}.exe'
    - source: https://github.com/digitalsleuth/UnAutoIt/releases/download/v{{ version }}/UnAutoIt-windows-amd64.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
