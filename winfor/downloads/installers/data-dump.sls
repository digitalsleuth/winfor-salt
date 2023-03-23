# Name: Data Dump
# Website: https://www.digital-detective.net/datadump/
# Description: Tool to extract segments of data from an image or device
# Category: Raw Parsers / Decoders
# Author: Craig Wilson (https://www.digital-detective.net)
# License: 
# Version: 2.2.23081.23
# Notes: x86

{% set version = '2.2.23081.23' %}
{% set hash = '19de76d21c0e6722d4e542821b9cdaf2431eb480ac499e8b464ba614b4c453b1' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

data-dump-download-only:
  file.managed:
    - name: '{{ downloads }}\DataDump-x86-EN-{{ version }}.zip'
    - source: https://www.digital-detective.net/download/download.php?downcode=nm3hquyi30jq1ea2gr8p
    - source_hash: sha256={{ hash }}
    - makedirs: True
