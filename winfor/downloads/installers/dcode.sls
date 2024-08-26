# Name: DCode
# Website: https://www.digital-detective.net/dcode
# Description: Timestamp encoder/decoder
# Category: Raw Parsers / Decoders
# Author: Craig Wilson (https://www.digital-detective.net)
# License: 
# Version: 5.6.24123.1
# Notes: 

{% set version = '5.6.24123.1' %}
{% set hash = '9ffe1106ee9d9f55b53d5707621d5990f493604e20f3dbdb0d22ec1b8ecb2458' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

dcode-download-only:
  file.managed:
    - name: '{{ downloads }}\dcode\DCode-x86-EN-{{ version }}.zip'
    - source: https://www.digital-detective.net/download/downloadbac.php?downcode=ae2znu5994j1lforlh03
    - source_hash: sha256={{ hash }}
    - makedirs: True
