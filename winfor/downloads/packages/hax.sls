# Name: H@x
# Website: https://thefreetoolproject.eu
# Description: Hex Editor for Investigators
# Category: Raw Parsers / Decoders
# Author: https://thefreetoolproject.eu/#DOWNLOADS
# License: GNU General Public License v3
# Version: 1.1.4
# Notes: 

{% set version = '1.1.4' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set hash = 'c023af66b10244b0a07367c5cbb120b19936c055acb2fa4c556c021bdedfeb8a' %}

hax-download-only:
  file.managed:
    - name: '{{ downloads }}\hax\Hax-{{ version }}-win64.exe'
    - source: https://thefreetoolproject.eu/hax/Hax-{{ version }}-win64.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
