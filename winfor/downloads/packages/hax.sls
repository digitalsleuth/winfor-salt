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
{% set hash = 'fec46541cd878f8ff984947753874c31eacb5b5ca36429233767ab8c4e031a30' %}

hax-download-only:
  file.managed:
    - name: '{{ downloads }}\hax\Hax-{{ version }}-win64.exe'
    - source: https://thefreetoolproject.eu/hax/Hax-{{ version }}-win64.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
