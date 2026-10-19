# Name: Magnet Chromebook Acquisition
# Website: https://www.magnetforensics.com
# Description: Evidence Acquisition for Chromebook
# Category: Acquisition and Analysis
# Author: Jad Saliba - Magnet Forensics
# License: EULA
# Version: 1.06
# Notes:

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '1.06' %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('magnet-chromebook-acquisition') %}

magnet-chromebook-acquisition:
  file.managed:
    - name: '{{ downloads }}\magnetforensics\magnet-chromebook-acquisition-{{ version }}.exe'
    - source: https://github.com/digitalsleuth/salt-winrepo-ng/raw/main/files/MCAA_Setup_v106.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
