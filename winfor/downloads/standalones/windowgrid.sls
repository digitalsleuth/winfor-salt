# Name: WindowGrid
# Website: http://windowgrid.net
# Description: Tool to easily align windows and icons to a grid on the Windows Desktop
# Category: Utilities
# Author: Joshua Wilding
# License: Unknown
# Version: 1.3.1.1
# Notes: 

{% set version = '1.3.1.1' %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('windowgrid') %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

windowgrid-download-only:
  file.managed:
    - name: '{{ downloads }}\windowgrid\windowgrid-{{ version }}.zip'
    - source: http://windowgrid.net/public/downloads/WindowGrid_{{ version }}.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
