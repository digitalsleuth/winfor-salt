# Name: Pilfer
# Website: https://github.com/digitalsleuth/forensics_tools
# Description: Rapid triage tool using Windows in-built binaries
# Category: Acquisition and Analysis
# Author: Corey Forman (digitalsleuth)
# License: GNU General Public License v3 (https://github.com/digitalsleuth/forensics_tools/blob/master/LICENSE)
# Version: 3.4
# Notes: 

{% set hash = '9d6ca8ea5e1a25d35e7eed2f9c1557bfbbd4eb202bec45aac01d462315a34b1e' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '3.4' %}

pilfer-download-only:
  file.managed:
    - name: '{{ downloads }}\pilfer\pilfer-{{ version }}.bat'
    - source: https://github.com/digitalsleuth/forensics_tools/raw/master/pilfer.bat
    - source_hash: sha256={{ hash }}
    - makedirs: True
