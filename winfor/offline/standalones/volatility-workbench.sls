# Name: Volatility Workbench
# Website: https://www.osforensics.com/tools/volatility-workbench.html
# Description: Windows-based GUI for the Volatility 3 Framework
# Category: Windows Analysis
# Author: OSForensics
# License: Volatility Software License (https://www.volatilityfoundation.org/license/vsl-v1.0)
# Version: 3.0.1016
# Notes:

{% set version = '3.0.1016' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set pkg = 'volatility-workbench-'~ version ~'.zip' %}
{% set exists = salt['file.file_exists'](downloads + '\\volatility-workbench\\' + pkg) %}

{% if exists %}

volatility-workbench-extract-offline:
  archive.extracted:
    - name: '{{ inpath }}\volatility-workbench'
    - source: '{{ downloads }}\volatility-workbench\{{ pkg }}'
    - enforce_toplevel: False
    - overwrite: True

volatility-workbench-shortcut-offline:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\Volatility Workbench.lnk'
    - target: '{{ inpath }}\volatility-workbench\VolatilityWorkbench.exe'
    - force: True
    - working_dir: '{{ inpath }}\volatility-workbench\'
    - makedirs: True
    - require:
      - archive: volatility-workbench-extract-offline

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
