# Name: LogViewer2
# Website: https://github.com/woanware/LogViewer2
# Description: View large text / log files
# Category: Logs
# Author: Mark Woan
# License: 
# Version: 1.0.0
# Notes: 

{% set version = '1.0.0' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set hash = '71aad9479657e5673f56b21b58977e151fa1ed4d82d55164e25e6aeaaeea4fa2' %}

logviewer2-download-only:
  file.managed:
    - name: '{{ downloads }}\logviewer2\logviewer2-{{ version }}.zip'
    - source: https://github.com/woanware/LogViewer2/releases/download/v{{ version }}/LogViewer2.v{{ version }}.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
