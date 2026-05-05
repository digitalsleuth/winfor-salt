# Name: Magnet Acquire
# Website: https://www.magnetforensics.com
# Description: Evidence Acquisition tool
# Category: Acquisition and Analysis
# Author: Jad Saliba - Magnet Forensics
# License: EULA
# Version: 2.95.0.43864
# Notes:

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '2.95.0.43864' %}
{% set file_version = '2950.43864' %}
{% set hash = '8957a467716fa61a7efc9be2ffec016394599dae6877e052d0fb2e0cafaca033' %}

magnet-acquire-download-only:
  file.managed:
    - name: '{{ downloads }}\magnetforensics\Acquirev{{ file_version }}setup.exe'
    - source: https://prod-releases.magnetforensics.com/acquire/{{ version }}/installer/Acquirev{{ file_version }}setup.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
