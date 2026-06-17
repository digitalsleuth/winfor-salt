# Name: Glossary Generator
# Website: (nil - in house tool)
# Description: Tool to generate a glossary for forensic reports
# Category: Utilities
# Author: Jad Saliba
# License: None Provided
# Version: 1.1
# Notes:

{% set version = '1.1' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

glossary-generator-extract-offline:
  archive.extracted:
    - name: '{{ inpath }}\glossary-generator\'
    - source: '{{ downloads }}\glossary-generator\gg-{{ version }}.zip'
    - enforce_toplevel: false

glossary-generator-shortcut-offline:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\Glossary Generator.lnk'
    - target: '{{ inpath }}\glossary-generator\GG.exe'
    - force: True
    - working_dir: '{{ inpath }}\glossary-generator\'
    - makedirs: True
    - require:
      - archive: glossary-generator-extract-offline
