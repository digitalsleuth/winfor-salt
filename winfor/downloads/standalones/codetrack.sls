# Name: Codetrack
# Website: https://www.getcodetrack.com
# Description: .NET Performance Profiler
# Category: Executables
# Author: Nico Van Goethem
# License: Freeware (see the About section in the application)
# Version: 1.0.3.3
# Notes: No longer maintained

{% set version = '1.0.3.3' %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('codetrack') %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

codetrack-download-only:
  file.managed:
    - name: '{{ downloads }}\codetrack\codetrack-{{ version }}.zip'
    - source: https://www.getcodetrack.com/releases/codetrack_{{ version | replace(".","_") }}.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
