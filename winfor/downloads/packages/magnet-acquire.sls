# Name: Magnet Acquire
# Website: https://www.magnetforensics.com
# Description: Evidence Acquisition tool
# Category: Acquisition and Analysis
# Author: Jad Saliba - Magnet Forensics
# License: EULA
# Version: 2.63.0.34742
# Notes:

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '2.63.0.34742' %}
{% set file_version = '2630.34742' %}
{% set hash = '4a464e4b1ddb007da86fea4b72e2ff2527def0918c2016a722327f130cd2f7b2' %}

magnet-acquire-download-only:
  file.managed:
    - name: '{{ downloads }}\Acquirev{{ file_version }}setup.exe'
    - source: https://prod-releases.magnetforensics.com/acquire/{{ version }}/installer/Acquirev{{ file_version }}setup.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
