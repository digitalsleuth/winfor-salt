# Name: Sysinternals
# Website: https://sysinternals.com
# Description: Suite of Windows Analysis and Management Tools
# Category: Windows Analysis
# Author: Microsoft / Mark Russinovich
# License: https://learn.microsoft.com/en-us/sysinternals/license-terms
# Version: 2026.07.09 (date of last update - no specific version number identified)
# Notes: 

{% set version = '2026.07.09' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set pkg = 'sysinternalssuite-'~ version ~'.zip' %}
{% set exists = salt['file.file_exists'](downloads + '\\sysinternals\\' + pkg) %}

{% if exists %}

sysinternals-extract-offline:
  archive.extracted:
    - name: '{{ inpath }}\sysinternals\'
    - source: '{{ downloads }}\sysinternals\{{ pkg }}'
    - enforce_toplevel: false

sysinternals-env-vars-offline:
  win_path.exists:
    - name: '{{ inpath }}\sysinternals'

sysinternals-shortcut-offline:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\Sysinternals.lnk'
    - target: '{{ inpath }}\sysinternals\'
    - force: True
    - working_dir: '{{ inpath }}\sysinternals\'
    - makedirs: True
    - require:
      - archive: sysinternals-extract-offline

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
