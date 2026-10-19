# Name: H@x
# Website: https://thefreetoolproject.eu
# Description: Hex Editor for Investigators
# Category: Raw Parsers / Decoders
# Author: https://thefreetoolproject.eu/#DOWNLOADS
# License: GNU General Public License v3
# Version: 1.1.6
# Notes: 

{% set version = '1.1.6' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('hax') %}

hax-download-only:
  file.managed:
    - name: '{{ downloads }}\hax\hax-{{ version }}.exe'
    - source: https://thefreetoolproject.eu/hax/Hax-{{ version }}-win64.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
