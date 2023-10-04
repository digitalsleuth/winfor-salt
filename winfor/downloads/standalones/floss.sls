# Name: FLOSS (FLARE Obfuscated String Solver)
# Website: https://github.com/mandiant/flare-floss
# Description: Extract obfuscated strings from malware
# Category: Executables
# Author: Mandiant
# License: Apache License v2.0 (https://github.com/mandiant/flare-floss/blob/master/LICENSE.txt)
# Version: 2.3.0
# Notes: 

{% set version = '2.3.0' %}
{% set hash = '30afca951815545e68c76feae0675127fe742e5b3b16f75ba751aef3985ab053' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

floss-download-only:
  file.managed:
    - name: '{{ downloads }}\floss-v{{ version }}-windows.zip'
    - source: https://github.com/mandiant/flare-floss/releases/download/v{{ version }}/floss-v{{ version }}-windows.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
