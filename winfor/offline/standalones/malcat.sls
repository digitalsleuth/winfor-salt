# Name: MalCat
# Website: https://malcat.fr
# Description: Malware Analysis Tool
# Category: Executables
# Author: Malcat EL
# License: https://malcat.fr/index.html#faq6
# Version: 0.9.14
# Notes: 

{% set version = '0.9.14' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set pkg = 'malcat-'~ version ~'.zip' %}
{% set exists = salt['file.file_exists'](downloads + '\\malcat\\' + pkg) %}

{% if exists %}

malcat-extract-offline:
  archive.extracted:
    - name: '{{ inpath }}\malcat'
    - source: '{{ downloads }}\malcat\{{ pkg }}'
    - enforce_toplevel: False

malcat-shortcut-offline:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\MalCat.lnk'
    - target: '{{ inpath }}\malcat\bin\malcat.exe'
    - force: True
    - working_dir: '{{ inpath }}\malcat\bin\'
    - makedirs: True
    - require:
      - archive: malcat-extract-offline

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
