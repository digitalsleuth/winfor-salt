# Name: Pilfer
# Website: https://github.com/digitalsleuth/forensics_tools
# Description: Rapid triage tool using Windows in-built binaries
# Category: Acquisition and Analysis
# Author: Corey Forman (digitalsleuth)
# License: GNU General Public License v3 (https://github.com/digitalsleuth/forensics_tools/blob/master/LICENSE)
# Version: 4.0
# Notes: 

{% set hash = '60b3e10664f3cefb397514dc290c078ea0e11129008c0d85967eb38df792efba' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '4.0' %}

pilfer-download-only:
  file.managed:
    - name: '{{ downloads }}\pilfer\pilfer-{{ version }}.bat'
    - source: https://github.com/digitalsleuth/forensics_tools/raw/master/pilfer.bat
    - source_hash: sha256={{ hash }}
    - makedirs: True
