# Name: Glossary Generator
# Website: (nil - in house tool)
# Description: Tool to generate a glossary for forensic reports
# Category: Utilities
# Author: Jad Saliba
# License: None Provided
# Version: 1.1
# Notes:

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

glossary-generator-archive:
  archive.extracted:
    - name: '{{ inpath }}\'
    - source: salt://winfor/files/gg.zip
    - enforce_toplevel: false

glossary-generator-folder-rename:
  file.rename:
    - name: '{{ inpath }}\glossary-generator'
    - source: '{{ inpath }}\Glossary Generator\'
    - force: True
    - makedirs: True
    - require:
      - archive: glossary-generator-archive
 
cpcwin-standalones-glossary-generator-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\Glossary Generator.lnk'
    - target: '{{ inpath }}\glossary-generator\GG.exe'
    - force: True
    - working_dir: '{{ inpath }}\glossary-generator\'
    - makedirs: True
    - require:
      - archive: glossary-generator-archive
