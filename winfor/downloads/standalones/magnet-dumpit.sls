# Name: Magnet DumpIt
# Website: https://www.magnetforensics.com
# Description: Windows Memory Dump tools from Comae / Magnet
# Category: Acquisition and Analysis
# Author: Magnet Forensics
# License: EULA
# Version: 20250131
# Notes: 

{% set version = '20250131' %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('magnet-dumpit') %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

magnet-dumpit-download-only:
  file.managed:
    - name: '{{ downloads }}\magnetforensics\magnet-dumpit-{{ version }}.zip'
    - source: https://storage.googleapis.com/prod-releases/comae_toolkit/Comae-Toolkit-v{{ version }}.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

