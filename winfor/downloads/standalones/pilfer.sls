# Name: Pilfer
# Website: https://github.com/digitalsleuth/forensics_tools
# Description: Rapid triage tool using Windows in-built binaries
# Category: Acquisition and Analysis
# Author: Corey Forman (digitalsleuth)
# License: GNU General Public License v3 (https://github.com/digitalsleuth/forensics_tools/blob/master/LICENSE)
# Version: 4.1
# Notes: 

{% set version = '4.1' %}
{% set hash = '047368b6c4a7429b85423fcb7661931ad8383629fd231ce42d19a7bb9ad3204c' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

pilfer-download-only:
  file.managed:
    - name: '{{ downloads }}\pilfer\pilfer-{{ version }}.bat'
    - source: https://github.com/digitalsleuth/forensics_tools/raw/master/pilfer.bat
    - source_hash: sha256={{ hash }}
    - makedirs: True
