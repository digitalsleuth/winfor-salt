# Name: Encrypted Disk Detector (EDD)
# Website: https://www.magnetforensics.com
# Description: Detects encrypted disks
# Category: Utilities
# Author: Magnet Forensics
# License: EULA
# Version: 310
# Notes: Standalone Utility

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set version = 'v310' %}

magnet-edd-extract-offline:
  archive.extracted:
    - name: '{{ inpath }}\magnet\EDD\'
    - source: '{{ downloads }}\magnetforensics\EDD{{ version }}.zip'
    - enforce_toplevel: False
