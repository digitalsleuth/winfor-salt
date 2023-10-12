# Name: WindowGrid
# Website: http://windowgrid.net
# Description: Tool to easily align windows and icons to a grid on the Windows Desktop
# Category: Utilities
# Author: Joshua Wilding
# License: Unknown
# Version: 1.3.1.1
# Notes: 

{% set version = '1.3.1.1' %}
{% set hash = 'EF7558B2869A1F74B81E19F1F84C715D95ABCA819920E6882D467323506EA25F' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

windowgrid-download-only:
  file.managed:
    - name: '{{ downloads }}\windowgrid\WindowGrid_{{ version }}.zip'
    - source: http://windowgrid.net/public/downloads/WindowGrid_{{ version }}.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
