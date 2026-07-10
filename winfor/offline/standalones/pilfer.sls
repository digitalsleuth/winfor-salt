# Name: Pilfer
# Website: https://github.com/digitalsleuth/forensics_tools
# Description: Rapid triage tool using Windows in-built binaries
# Category: Acquisition and Analysis
# Author: Corey Forman (digitalsleuth)
# License: GNU General Public License v3 (https://github.com/digitalsleuth/forensics_tools/blob/master/LICENSE)
# Version: 4.1
# Notes: 

{% set version = '4.1' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'pilfer-'~ version ~'.bat' %}
{% set exists = salt['file.file_exists'](downloads + '\\pilfer\\' + pkg) %}

{% if exists %}

pilfer-copy-offline:
  file.copy:
    - name: '{{ inpath }}\pilfer\pilfer.bat'
    - source: '{{ downloads }}\pilfer\pilfer-{{ version }}.bat'
    - makedirs: True
    - force: True

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
