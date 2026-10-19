# Name: Encrypted Disk Detector (EDD)
# Website: https://www.magnetforensics.com
# Description: Detects encrypted disks
# Category: Utilities
# Author: Magnet Forensics
# License: EULA
# Version: 310
# Notes: Standalone Utility

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('magnet-edd') %}
{% set version = 'v310' %}

magnet-edd-download:
  file.managed:
    - name: 'C:\salt\tempdownload\EDD{{ version }}.zip'
    - source: https://storage.googleapis.com/mfi-files/free_tools/EDD/EDD{{ version }}.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

magnet-edd-extract:
  archive.extracted:
    - name: '{{ inpath }}\magnet\EDD\'
    - source: 'C:\salt\tempdownload\EDD{{ version }}.zip'
    - enforce_toplevel: False
    - require:
      - file: magnet-edd-download

