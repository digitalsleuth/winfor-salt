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
{% set version_parts = version.rsplit('.', 1) %}
{% set file_version = version_parts[0] | replace('.', '') ~ '.' ~ version_parts[1] %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('magnet-acquire') %}

magnet-acquire-download-only:
  file.managed:
    - name: '{{ downloads }}\magnetforensics\magnet-acquire-{{ version }}.exe'
    - source: https://prod-releases.magnetforensics.com/acquire/{{ version }}/installer/Acquirev{{ file_version }}setup.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
