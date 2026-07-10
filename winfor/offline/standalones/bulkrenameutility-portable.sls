# Name: Bulk Rename Utility
# Website: https://www.bulkrenameutility.co.uk
# Description: Tool to rename multiple files with similar names
# Category: Utilities
# Author: TGRMN Software
# License: EULA (https://www.bulkrenameutility.co.uk/License.php)
# Version: 4.1.0.1
# Notes: 

{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set version = '4.1.0.1' %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set pkg = 'bulk-rename-utility-portable-'~ version ~'.zip' %}
{% set exists = salt['file.file_exists'](downloads + '\\bulk-rename-utility\\' + pkg) %}

{% if exists %}

bulkrenameutility-portable-extract-offline:
  archive.extracted:
    - name: '{{ inpath }}\bulk-rename-utility\'
    - source: '{{ downloads }}\bulk-rename-utility\{{ pkg }}'
    - enforce_toplevel: False

bulkrenameutility-portable-shortcut-offline:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\Bulk Rename Utility Portable.lnk'
    - target: '{{ inpath }}\bulk-rename-utility\64-bit\Bulk Rename Utility.exe'
    - force: True
    - working_dir: {{ inpath }}\bulk-rename-utility\
    - makedirs: True
    - require:
      - archive: bulkrenameutility-portable-extract-offline

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
