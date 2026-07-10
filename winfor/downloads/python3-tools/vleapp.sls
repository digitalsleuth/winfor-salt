# Name: VLEAPP
# Website: https://github.com/abrignoni/vleapp
# Description: Vehicle Logs Events and Properties Parser
# Category: Mobile Analysis
# Author: Alexis Brignoni
# License: MIT License (https://github.com/abrignoni/VLEAPP/blob/main/LICENSE)
# Version: 2.2.0
# Notes:

{% set version = '2.2.0' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set hash = '39CB3ABA6471979ECC04B017D973667E77AC6BA0B3A894A4DCA7F9EE7CD3EAE7' %}

include:
  - winfor.standalones.portable-python3

vleapp-source-download-only:
  file.managed:
    - name: '{{ downloads }}\VLEAPP-{{ version }}.zip'
    - source: https://github.com/abrignoni/VLEAPP/archive/refs/tags/v{{ version }}.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

vleapp-source-extract-download-only:
  archive.extracted:
    - name: '{{ downloads }}\'
    - source: '{{ downloads }}\VLEAPP-{{ version }}.zip'
    - enforce_toplevel: False
    - require:
      - file: vleapp-source-download-only

vleapp-folder-rename:
  file.rename:
    - name: '{{ downloads }}\vleapp'
    - source: '{{ downloads }}\VLEAPP-{{ version }}'
    - force: True
    - require:
      - archive: vleapp-source-extract-download-only

vleapp-patch-requirements-download-only:
  file.line:
    - name: '{{ downloads }}\vleapp\requirements.txt'
    - mode: replace
    - match: "packaging==20.1"
    - content: "packaging==24.1"
    - require:
      - file: vleapp-source-download-only
      - archive: vleapp-source-extract-download-only

vleapp-requirements-download-only:
  cmd.run:
    - name: '{{ inpath }}\portable-python3\python.exe -m pip download -r requirements.txt -d packages'
    - cwd: '{{ downloads }}\vleapp'
    - require:
      - file: vleapp-source-download-only
      - sls: winfor.standalones.portable-python3

vleapp-header-download-only:
  file.prepend:
    - names:
      - '{{ downloads }}\vleapp\vleapp.py'
      - '{{ downloads }}\vleapp\vleappGUI.py'
    - text: '#!/usr/bin/python3'
    - require:
      - file: vleapp-source-download-only
      - cmd: vleapp-requirements-download-only

vleapp-icon-download-only:
  file.managed:
    - name: '{{ downloads }}\vleapp\vleapp.ico'
    - source: salt://winfor/files/vleapp.ico
    - skip_verify: True
    - makedirs: True

vleapp-delete-zip-download-only:
  file.absent:
    - name: '{{ downloads }}\VLEAPP-{{ version }}.zip'
    - require:
      - file: vleapp-source-download-only
      - archive: vleapp-source-extract-download-only
      - cmd: vleapp-requirements-download-only
