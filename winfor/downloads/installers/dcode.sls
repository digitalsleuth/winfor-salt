# Name: DCode
# Website: https://www.digital-detective.net/dcode
# Description: Timestamp encoder/decoder
# Category: Raw Parsers / Decoders
# Author: Craig Wilson (https://www.digital-detective.net)
# License: 
# Version: 5.7.26188.46
# Notes: 

{% set version = '5.7.26188.46' %}
{% set hash = 'be3383c8c37af8a8e2978011009d8bb3041c294eeda0ec8424341c8cec2e064f' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

dcode-download-only:
  file.managed:
    - name: '{{ downloads }}\dcode\dcode-{{ version }}.zip'
    - source: https://www.digital-detective.net/download/downloadbac.php?downcode=ae2znu5994j1lforlh03
    - source_hash: sha256={{ hash }}
    - makedirs: True
