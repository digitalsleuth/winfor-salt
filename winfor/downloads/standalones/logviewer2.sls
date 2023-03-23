# Name: LogViewer2
# Website: https://github.com/woanware/LogViewer2
# Description: View large text / log files
# Category: Logs
# Author: Mark Woan
# License: 
# Version: 1.0.0
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

logviewer2-download-only:
  file.managed:
    - name: '{{ downloads }}\LogViewer2.v1.0.0.zip'
    - source: https://github.com/woanware/LogViewer2/releases/download/v1.0.0/LogViewer2.v1.0.0.zip
    - source_hash: sha256=71aad9479657e5673f56b21b58977e151fa1ed4d82d55164e25e6aeaaeea4fa2
    - makedirs: True
