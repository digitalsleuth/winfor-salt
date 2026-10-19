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
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('fiddler') %}

fiddler-download-only:
  file.managed:
    - name: '{{ downloads }}\fiddler\fiddler-{{ version }}.exe'
    - source: https://downloads.getfiddler.com/fiddler-classic/FiddlerSetup.{{ version }}-latest.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
