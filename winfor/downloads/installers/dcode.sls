# Name: DCode
# Website: https://www.digital-detective.net/dcode
# Description: Timestamp encoder/decoder
# Category: Raw Parsers / Decoders
# Author: Craig Wilson (https://www.digital-detective.net)
# License: 
# Version: 5.7.26188.46
# Notes: 

{% set version = '5.7.26188.46' %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('dcode') %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

dcode-download-only:
  file.managed:
    - name: '{{ downloads }}\dcode\dcode-{{ version }}.zip'
    - source: https://www.digital-detective.net/download/downloadbac.php?downcode=ae2znu5994j1lforlh03
    - source_hash: sha256={{ hash }}
    - makedirs: True
