# Name: Magnet Acquire
# Website: https://www.magnetforensics.com
# Description: Evidence Acquisition tool
# Category: Acquisition and Analysis
# Author: Jad Saliba - Magnet Forensics
# License: EULA
# Version: 2.61.0.33597
# Notes:

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '2.61.0.33597' %}
{% set file_version = '2610.33597' %}
{% set hash = '4be703f7c91e1e1f724a85fd6c46377125e041cd447a3a776e06666a52c243f4' %}

magnet-acquire-download-only:
  file.managed:
    - name: '{{ downloads }}\Acquirev{{ file_version }}setup.exe'
    - source: https://prod-releases.magnetforensics.com/acquire/{{ version }}/installer/Acquirev{{ file_version }}setup.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
