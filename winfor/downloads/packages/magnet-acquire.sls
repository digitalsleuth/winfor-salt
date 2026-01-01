# Name: Magnet Acquire
# Website: https://www.magnetforensics.com
# Description: Evidence Acquisition tool
# Category: Acquisition and Analysis
# Author: Jad Saliba - Magnet Forensics
# License: EULA
# Version: 2.92.0.43217
# Notes:

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '2.92.0.43217' %}
{% set file_version = '2920.43217' %}
{% set hash = '4998b357ca2c3921aa670db0a9679fb5ae4e0edea4e898572df8fbe8ac3d030e' %}

magnet-acquire-download-only:
  file.managed:
    - name: '{{ downloads }}\magnetforensics\Acquirev{{ file_version }}setup.exe'
    - source: https://prod-releases.magnetforensics.com/acquire/{{ version }}/installer/Acquirev{{ file_version }}setup.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
