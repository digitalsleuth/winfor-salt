# Name: MiTeC Tool Suite
# Website: https://mitec.cz
# Description: Suite of Windows-based analysis tools
# Category: Windows Analysis
# Author: Michal Mutl (mitec)
# License: Free to use for private, educational and non-commercial purposes
# Version: Various
# Notes:

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set files = ['ADOQuery','DataEdit','NetScanner','TMX','SE','IHB','EHB','WFA','WRR','SSView','HEXEdit','MailView','EXE','XMLView','JSONView','PhotoView','SQLiteQ'] %}

{% for file in files %}

mitec-extract-{{ file }}-offline:
  archive.extracted:
    - name: {{ inpath }}\mitec\{{ file }}
    - source: {{ downloads }}\mitec\{{ file }}.zip
    - enforce_toplevel: false

{% if file != "SQLiteQ" %}
mitec-{{ file }}-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\{{ file }}.lnk'
    - target: '{{ inpath }}\mitec\{{ file }}\{{ file }}.exe'
    - force: True
    - working_dir: '{{ inpath }}\mitec\{{ file }}\'
    - makedirs: True
    - require:
      - archive: mitec-extract-{{ file }}-offline

{% else %}

mitec-{{ file }}-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\SQLiteQuery.lnk'
    - target: '{{ inpath }}\mitec\{{ file }}\SQLiteQuery.exe'
    - force: True
    - working_dir: '{{ inpath }}\mitec\{{ file }}\'
    - makedirs: True
    - require:
      - archive: mitec-extract-{{ file }}-offline

{% endif %}
{% endfor %}
