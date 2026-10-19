# Name: NTCore Explorer Suite
# Website: https://ntcore.com
# Description: PE Analysis tool suite
# Category: Executables
# Author: Erik Pistelli
# License: 
# Version: IV
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = 'IV' %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('ntcore-explorersuite') %}

ntcore-explorersuite-download-only:
  file.managed:
    - name: '{{ downloads }}\ntcore-explorersuite\ntcore-explorersuite-{{ version }}.exe'
    - source: https://ntcore.com/files/ExplorerSuite.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
