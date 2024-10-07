# Name: Data Dump
# Website: https://www.digital-detective.net/datadump/
# Description: Tool to extract segments of data from an image or device
# Category: Raw Parsers / Decoders
# Author: Craig Wilson (https://www.digital-detective.net)
# License: 
# Version: 2.3.24262.11
# Notes: x86

{% set version = '2.3.24262.11' %}
{% set hash = '5a6ce7be7ed6bb38db624df3b2c7e029755ddc9a7176aa4ae1220dbcaaf0693c' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

data-dump-download-only:
  file.managed:
    - name: '{{ downloads }}\data-dump\DataDump-x86-EN-{{ version }}.zip'
    - source: https://www.digital-detective.net/download/download.php?downcode=nm3hquyi30jq1ea2gr8p
    - source_hash: sha256={{ hash }}
    - makedirs: True
