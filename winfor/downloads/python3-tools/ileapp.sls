# Name: ILEAPP
# Website: https://github.com/abrignoni/ileapp
# Description: iOS Logs Events and Plists Parser
# Category: Mobile Analysis
# Author: Alexis Brignoni
# License: MIT License (https://github.com/abrignoni/iLEAPP/blob/main/LICENSE)
# Version: 2.3.1
# Notes:

{% set version = '2.3.1' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set hash = 'fe5d74d033b43533c7954195832c729cbf090177211f159299f6e499b6457a45' %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

include:
  - winfor.standalones.portable-python3
  - winfor.downloads.packages.ms-vcpp-2015-build-tools

ileapp-source-download-only:
  file.managed:
    - name: '{{ downloads }}\ileapp-{{ version }}.zip'
    - source: https://github.com/abrignoni/ileapp/archive/refs/tags/v{{ version }}.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

ileapp-source-extract-download-only:
  archive.extracted:
    - name: '{{ downloads }}\'
    - source: '{{ downloads }}\ileapp-{{ version }}.zip'
    - enforce_toplevel: False
    - require:
      - file: ileapp-source-download-only

ileapp-folder-rename:
  file.rename:
    - name: '{{ downloads }}\ileapp'
    - source: '{{ downloads }}\ileapp-{{ version }}'
    - force: True
    - require:
      - archive: ileapp-source-extract-download-only

ileapp-requirements-download-only:
  cmd.run:
    - name: '{{ inpath }}\portable-python3\python.exe -m pip download -r requirements.txt -d packages'
    - cwd: '{{ downloads }}\ileapp'
    - require:
      - file: ileapp-source-download-only
      - sls: winfor.standalones.portable-python3
      - sls: winfor.downloads.packages.ms-vcpp-2015-build-tools

ileapp-wheel-requirement-download-only:
  cmd.run:
    - name: '{{ inpath }}\portable-python3\python.exe -m pip download wheel -d packages'
    - cwd: '{{ downloads }}\ileapp'
    - require:
      - file: ileapp-source-download-only
      - sls: winfor.standalones.portable-python3
      - sls: winfor.downloads.packages.ms-vcpp-2015-build-tools

ileapp-icon-download-only:
  file.managed:
    - name: '{{ downloads }}\ileapp\ileapp.ico'
    - source: salt://winfor/files/ileapp.ico
    - skip_verify: True
    - makedirs: True

ileapp-delete-zip-download-only:
  file.absent:
    - name: '{{ downloads }}\ileapp-{{ version }}.zip'
    - require:
      - file: ileapp-source-download-only
      - archive: ileapp-source-extract-download-only
      - cmd: ileapp-requirements-download-only
