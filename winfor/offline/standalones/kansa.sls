# Name: Kansa
# Website: https://github.com/davehull/kansa
# Description: Powershell Incident Response Framework
# Category: Windows Analysis
# Author: Dave Hull
# License: Apache License v2.0 (https://github.com/davehull/Kansa/blob/master/LICENSE)
# Version: 18NOV2022 (No defined version)
# Notes: 

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'kansa.zip' %}
{% set exists = salt['file.file_exists'](downloads + '\\kansa\\' + pkg) %}

{% if exists %}

kansa-extract-offline:
  archive.extracted:
    - name: '{{ inpath }}\'
    - source: '{{ downloads }}\kansa\kansa.zip'
    - enforce_toplevel: False

kansa-folder-rename-offline:
  file.rename:
    - name: '{{ inpath }}\kansa'
    - source: '{{ inpath }}\Kansa-master'
    - makedirs: True
    - force: True
    - require:
      - archive: kansa-extract-offline

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
