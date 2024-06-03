# Name: Magnet Acquire
# Website: https://www.magnetforensics.com
# Description: Evidence Acquisition tool
# Category: Acquisition and Analysis
# Author: Jad Saliba - Magnet Forensics
# License: EULA
# Version: 2.74.0.39439
# Notes:

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '2.74.0.39439' %}
{% set file_version = '2740.39439' %}
{% set hash = '31f1cda096b8761d4cb0af6b2978b24574bd685ffe235b3e8e607e0c0a22b0cf' %}

magnet-acquire-download-only:
  file.managed:
    - name: '{{ downloads }}\magnetforensics\Acquirev{{ file_version }}setup.exe'
    - source: https://prod-releases.magnetforensics.com/acquire/{{ version }}/installer/Acquirev{{ file_version }}setup.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
