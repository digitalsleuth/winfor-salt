# Name: API Monitor v2 Alpha
# Website: http://www.rohitab.com/apimonitor
# Description: Tool to monitor API calls by applications
# Category: Executables
# Author: Rohitab Batra
# License: 
# Version: v2r13
# Notes: 

{% set hash = '46c1f2f4e8dfa8e0c2775b1cc4a20491d7413a87f3d08e8385f1e70dba6756e9' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

apimonitor-download-only:
  file.managed:
    - name: '{{ downloads }}\api-monitor\api-monitor-v2r13-setup-x64.exe'
    - source: http://www.rohitab.com/download/api-monitor-v2r13-setup-x64.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
