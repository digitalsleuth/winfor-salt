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
{% set hash = '94f4348ec573b05990b1e19542986e46dc30a87870739f5d5430b60072d5144d' %}

ntcore-explorersuite-download-only:
  file.managed:
    - name: '{{ downloads }}\ExplorerSuite.exe'
    - source: https://ntcore.com/files/ExplorerSuite.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
