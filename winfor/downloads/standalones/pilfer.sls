# Name: Pilfer
# Website: https://github.com/digitalsleuth/forensics_tools
# Description: Rapid triage tool using Windows in-built binaries
# Category: Acquisition and Analysis
# Author: Corey Forman (digitalsleuth)
# License: GNU General Public License v3 (https://github.com/digitalsleuth/forensics_tools/blob/master/LICENSE)
# Version: 3.3
# Notes: 

{% set hash = 'd7176008dfd015a7ea74b2aa634449e08d4ded6feed8e03c53e1e3878c30839d' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '3.3' %}

pilfer-download-only:
  file.managed:
    - name: '{{ downloads }}\pilfer\pilfer-{{ version }}.bat'
    - source: https://github.com/digitalsleuth/forensics_tools/raw/master/pilfer.bat
    - source_hash: sha256={{ hash }}
    - makedirs: True
