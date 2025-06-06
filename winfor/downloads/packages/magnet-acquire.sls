# Name: Magnet Acquire
# Website: https://www.magnetforensics.com
# Description: Evidence Acquisition tool
# Category: Acquisition and Analysis
# Author: Jad Saliba - Magnet Forensics
# License: EULA
# Version: 2.85.0.42049
# Notes:

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '2.85.0.42049' %}
{% set file_version = '2850.42049' %}
{% set hash = 'e6df1679965545cb0e57c373b271833e9e27cb3482ba33df7d6a73a62ac58951' %}

magnet-acquire-download-only:
  file.managed:
    - name: '{{ downloads }}\magnetforensics\Acquirev{{ file_version }}setup.exe'
    - source: https://prod-releases.magnetforensics.com/acquire/{{ version }}/installer/Acquirev{{ file_version }}setup.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
