# Name: Noriben
# Website: https://github.com/rurik/noriben
# Description: Malware Analysis Sandbox based on Python
# Category: Executables
# Author: Brian Baskin (Rurik)
# License: Apache License v2 (https://github.com/Rurik/Noriben/blob/master/LICENSE)
# Version: 2.0.4
# Notes: 

{% set version = '2.0.4' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set hash = '48f6076eecbee5b7c96b6ef2086b177d158cc7326b83171246f68bd86e6a5212' %}

noriben-download-only:
  file.managed:
    - name: '{{ downloads }}\noriben-{{ version }}.zip'
    - source: https://github.com/Rurik/Noriben/archive/refs/heads/main.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

noriben-extract-download-only:
  archive.extracted:
    - name: '{{ downloads }}\'
    - source: '{{ downloads }}\noriben-{{ version }}.zip'
    - enforce_toplevel: False
    - require:
      - file: noriben-download-only

noriben-folder-rename-download-only:
  file.rename:
    - name: '{{ downloads }}\noriben'
    - source: '{{ downloads }}\Noriben-main'
    - makedirs: True
    - force: True
    - require:
      - archive: noriben-extract-download-only

noriben-header-download-only:
  file.prepend:
    - name: '{{ downloads }}\noriben\Noriben.py'
    - text: '#!/usr/bin/python3'
    - require:
      - file: noriben-folder-rename-download-only

noriben-remove-archive-download-only:
  file.absent:
    - name: '{{ downloads }}\noriben-{{ version }}.zip'
    - require:
      - file: noriben-header-download-only
