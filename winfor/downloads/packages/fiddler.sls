# Name: Telerik Fiddler
# Website: https://www.telerik.com
# Description: Web debugging proxy tool
# Category: Network
# Author: Telerik
# License: 
# Version: 5.0.20211.51073
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '5.0.20211.51073' %}
{% set hash = '5c92f0738c290eac319d4ac3006b5725f1d2163fbfe68dbb2047e07920f4d5e8' %}

fiddler-download-only:
  file.managed:
    - name: '{{ downloads }}\fiddler\FiddlerSetup-{{ version }}.exe'
    - source: https://telerik-fiddler.s3.amazonaws.com/fiddler/FiddlerSetup.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
