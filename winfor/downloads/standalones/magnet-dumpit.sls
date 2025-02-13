# Name: Magnet DumpIt
# Website: https://www.magnetforensics.com
# Description: Windows Memory Dump tools from Comae / Magnet
# Category: Acquisition and Analysis
# Author: Magnet Forensics
# License: EULA
# Version: 20250131
# Notes: 

{% set version = '20250131' %}
{% set hash = '096b559844030e79e9bc017b91dc23ab064f6f1f23d78b385b8b5c3172ed99f3' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

magnet-dumpit-download-only:
  file.managed:
    - name: '{{ downloads }}\magnetforensics\Comae-Toolkit-v{{ version }}.zip'
    - source: https://storage.googleapis.com/prod-releases/comae_toolkit/Comae-Toolkit-v{{ version }}.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

