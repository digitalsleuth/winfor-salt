# Name: Magnet Acquire
# Website: https://www.magnetforensics.com
# Description: Evidence Acquisition tool
# Category: Acquisition and Analysis
# Author: Jad Saliba - Magnet Forensics
# License: EULA
# Version: 2.82.0.41575
# Notes:

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '2.82.0.41575' %}
{% set file_version = '2820.41575' %}
{% set hash = '775bbc41cbc5e21c19e21acc0e19a927a9e4579bedba83d3a5b62211a1bcc471' %}

magnet-acquire-download-only:
  file.managed:
    - name: '{{ downloads }}\magnetforensics\Acquirev{{ file_version }}setup.exe'
    - source: https://prod-releases.magnetforensics.com/acquire/{{ version }}/installer/Acquirev{{ file_version }}setup.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
