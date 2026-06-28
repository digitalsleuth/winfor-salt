# Name: PEiD
# Website: https://github.com/wolfram77web/app-peid
# Description: Portable Executable identifier
# Category: Executables
# Author: snaker / Qwerton / Jibz
# License: All Rights Reserved
# Version: 0.95
# Notes: 

{% set version = '0.95' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set files = ['peid-' + version + '.exe', 'peid-userdb.txt', 'peid.ico'] %}

{% for file in files %}

peid-copy-{{ file }}-offline:
  file.copy:
    - name: '{{ inpath }}\peid\{{ file }}'
    - source: '{{ downloads }}\peid\{{ file }}'
    - skip_verify: True
    - makedirs: True
    - force: True

{% endfor %}

peid-rename-exe-offline:
  file.rename:
    - name: '{{ inpath }}\peid\peid.exe'
    - source: '{{ inpath }}\peid\peid-{{ version }}.exe'
    - require:
      - file: peid-copy-peid-{{ version }}.exe-offline

peid-shortcut-offline:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\PEiD.lnk'
    - target: '{{ inpath }}\peid\peid.exe'
    - force: True
    - icon_location: '{{ inpath }}\peid\peid.ico'
    - working_dir: '{{ inpath }}\peid\'
    - makedirs: True
    - require:
      - file: peid-copy-peid-{{ version }}.exe-offline
      - file: peid-rename-exe-offline
