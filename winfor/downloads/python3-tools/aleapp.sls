# Name: ALEAPP
# Website: https://github.com/abrignoni/aleapp
# Description: Android Logs Events and Protobuf Parser
# Category: Mobile Analysis
# Author: Alexis Brignoni
# License: MIT License (https://github.com/abrignoni/ALEAPP/blob/main/LICENSE)
# Version: 3.4.1
# Notes: 

{% set version = '3.4.1' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set hash = '16516091fa560aeecc1f7e06509b863a448606055ddf66ac5355f2c2b28ded4a' %}

include:
  - winfor.standalones.portable-python3

aleapp-source-download-only:
  file.managed:
    - name: '{{ downloads }}\ALEAPP-{{ version }}.zip'
    - source: https://github.com/abrignoni/ALEAPP/archive/refs/tags/v{{ version }}.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

aleapp-source-extract-download-only:
  archive.extracted:
    - name: '{{ downloads }}\'
    - source: '{{ downloads }}\ALEAPP-{{ version }}.zip'
    - enforce_toplevel: False
    - require:
      - file: aleapp-source-download-only

aleap-folder-rename:
  file.rename:
    - name: '{{ downloads }}\aleapp'
    - source: '{{ downloads }}\ALEAPP-{{ version }}'
    - force: True
    - require:
      - archive: aleapp-source-extract-download-only

aleapp-patch-requirements-download-only:
  file.line:
    - name: '{{ downloads }}\aleapp\requirements.txt'
    - mode: replace
    - match: "packaging==20.1"
    - content: "packaging==24.1"
    - require:
      - file: aleapp-source-download-only
      - archive: aleapp-source-extract-download-only

aleapp-requirements-download-only:
  cmd.run:
    - name: '{{ inpath }}\portable-python3\python.exe -m pip download -r requirements.txt -d packages'
    - cwd: '{{ downloads }}\aleapp'
    - require:
      - file: aleapp-source-download-only
      - sls: winfor.standalones.portable-python3

aleapp-header-download-only:
  file.prepend:
    - names:
      - '{{ downloads }}\aleapp\aleapp.py'
      - '{{ downloads }}\aleapp\aleappGUI.py'
    - text: '#!/usr/bin/python3'
    - require:
      - file: aleapp-source-download-only
      - cmd: aleapp-requirements-download-only

aleapp-icon-download-only:
  file.managed:
    - name: '{{ downloads }}\aleapp\aleapp.ico'
    - source: salt://winfor/files/aleapp.ico
    - skip_verify: True
    - makedirs: True

aleapp-delete-zip-download-only:
  file.absent:
    - name: '{{ downloads }}\ALEAPP-{{ version }}.zip'
    - require:
      - file: aleapp-source-download-only
      - archive: aleapp-source-extract-download-only
      - cmd: aleapp-requirements-download-only
