# Name: NAFT - Network Appliance Forensic Toolkit
# Website: https://github.com/digitalsleuth/naft
# Description: Updated version of Didier Stevens Network Appliance memory dump analyzer
# Category: Network
# Author: Corey Forman / Gabriel Cossette / Didier Stevens
# License: MIT License (https://github.com/digitalsleuth/naft/blob/main/LICENSE.md)
# Version: 1.0.0b1
# Notes: 

{% set version = '1.0.0b1' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set hash = '50033d508ec6c36e9569c45397623e14f3a492cb62a881f3dd53eb6873eb21f3' %}

include:
  - winfor.downloads.python3-tools.python-dateutil

naft-download-only:
  file.managed:
    - name: '{{ downloads }}\naft-{{ version }}.zip'
    - source: https://github.com/digitalsleuth/naft/archive/refs/heads/main.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
    - require:
      - sls: winfor.downloads.python3-tools.python-dateutil

naft-extract-download-only:
  archive.extracted:
    - name: '{{ downloads }}\'
    - source: '{{ downloads }}\naft-{{ version }}.zip'
    - enforce_toplevel: False
    - require:
      - file: naft-download-only

naft-folder-rename-download-only:
  file.rename:
    - name: '{{ downloads }}\naft'
    - source: '{{ downloads }}\naft-main'
    - makedirs: True
    - force: True

naft-delete-archive-download-only:
  file.absent:
    - name: '{{ downloads }}\naft-{{ version }}.zip'
    - require:
      - file: naft-download-only
      - archive: naft-extract-download-only
