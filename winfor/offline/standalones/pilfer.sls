# Name: Pilfer
# Website: https://github.com/digitalsleuth/forensics_tools
# Description: Rapid triage tool using Windows in-built binaries
# Category: Acquisition and Analysis
# Author: Corey Forman (digitalsleuth)
# License: GNU General Public License v3 (https://github.com/digitalsleuth/forensics_tools/blob/master/LICENSE)
# Version: 4.0
# Notes: 

{% set version = '4.0' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}

pilfer-copy-offline:
  file.copy:
    - name: '{{ inpath }}\pilfer\pilfer.bat'
    - source: '{{ downloads }}\pilfer\pilfer-{{ version }}.bat'
    - makedirs: True
    - force: True

