# Name: Magnet Acquire
# Website: https://www.magnetforensics.com
# Description: Evidence Acquisition tool
# Category: Acquisition and Analysis
# Author: Jad Saliba - Magnet Forensics
# License: EULA
# Version: 2.68.0.36478
# Notes:

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '2.68.0.36478' %}
{% set file_version = '2680.36478' %}
{% set hash = '9e8f1573fbd28b27b4e88e502a19d2b59d91fa15ccb371b1312d4ce2e4ca82fa' %}

magnet-acquire-download-only:
  file.managed:
    - name: '{{ downloads }}\Acquirev{{ file_version }}setup.exe'
    - source: https://prod-releases.magnetforensics.com/acquire/{{ version }}/installer/Acquirev{{ file_version }}setup.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
