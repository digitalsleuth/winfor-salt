# Name: Encrypted Disk Detector (EDD)
# Website: https://www.magnetforensics.com
# Description: Detects encrypted disks
# Category: Utilities
# Author: Magnet Forensics
# License: EULA
# Version: 310
# Notes: Standalone Utility

{% set hash = '6e0ab06b04e1d7fd2ede11d1f607422ab3f6683086c3ccf12e9ed8053d4c3796' %}
{% set version = 'v310' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

magnet-edd-download-only:
  file.managed:
    - name: '{{ downloads }}\magnetforensics\EDD{{ version }}.zip'
    - source: https://storage.googleapis.com/mfi-files/free_tools/EDD/EDD{{ version }}.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
