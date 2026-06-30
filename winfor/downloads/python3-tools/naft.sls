# Name: NAFT - Network Appliance Forensic Toolkit
# Website: https://github.com/digitalsleuth/naft
# Description: Updated version of Didier Stevens Network Appliance memory dump analyzer
# Category: Network
# Author: Corey Forman / Gabriel Cossette / Didier Stevens
# License: MIT License (https://github.com/digitalsleuth/naft/blob/main/LICENSE.md)
# Version: 1.0.2
# Notes: 

{% set version = '1.0.2' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

include:
  - winfor.standalones.portable-python3

naft-folder-download-only:
  file.directory:
    - name: '{{ downloads }}\naft\'
    - force: True
    - makedirs: True
    - win_inheritance: True

naft-download-only:
  cmd.run:
    - name: '{{ inpath }}\portable-python3\python.exe -m pip download -d packages naft'
    - cwd: '{{ downloads }}\naft'
    - require:
      - sls: winfor.standalones.portable-python3
      - file: naft-folder-download-only
