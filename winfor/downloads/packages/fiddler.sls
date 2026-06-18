# Name: Telerik Fiddler
# Website: https://www.telerik.com
# Description: Web debugging proxy tool
# Category: Network
# Author: Telerik
# License: 
# Version: 5.0.20261.4301
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '5.0.20261.4301' %}
{% set hash = 'ae04d25bd1f20ca2d4f6a7f59faaab8033c2f4033723bb473825c0197ea34d01' %}

fiddler-download-only:
  file.managed:
    - name: '{{ downloads }}\fiddler\FiddlerSetup-{{ version }}.exe'
    - source: https://downloads.getfiddler.com/fiddler-classic/FiddlerSetup.{{ version }}-latest.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
