# Name: Pilfer
# Website: https://github.com/digitalsleuth/forensics_tools
# Description: Rapid triage tool using Windows in-built binaries
# Category: Acquisition and Analysis
# Author: Corey Forman (digitalsleuth)
# License: GNU General Public License v3 (https://github.com/digitalsleuth/forensics_tools/blob/master/LICENSE)
# Version: 3.0
# Notes: 

{% set hash = '9a3e86d728c643723ab9ad6ff30bc91d7fdcb805524d1eee2c6dd4d336bba43a' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '3.0' %}

pilfer-download-only:
  file.managed:
    - name: '{{ downloads }}\pilfer\pilfer-{{ version }}.bat'
    - source: https://github.com/digitalsleuth/forensics_tools/raw/master/pilfer.bat
    - source_hash: sha256={{ hash }}
    - makedirs: True
