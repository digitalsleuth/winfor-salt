# Name: Encrypted Disk Detector (EDD)
# Website: https://www.magnetforensics.com
# Description: Detects encrypted disks
# Category: Utilities
# Author: Magnet Forensics
# License: EULA
# Version: 310
# Notes: Standalone Utility

{% set version = '310' %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('magnet-edd') %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

magnet-edd-download-only:
  file.managed:
    - name: '{{ downloads }}\magnetforensics\magnet-edd-{{ version }}.zip'
    - source: https://storage.googleapis.com/mfi-files/free_tools/EDD/EDDv{{ version }}.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
