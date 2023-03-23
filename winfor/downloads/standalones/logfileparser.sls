# Name: LogFileParser
# Website: https://github.com/jschicht/LogFileParser
# Description: NTFS $LogFile Parser
# Category: Windows Analysis
# Author: Joakim Schicht
# License: MIT (https://github.com/jschicht/LogFileParser/blob/master/LICENSE.md)
# Version: 2.0.0.49
# Notes: 

{% set hash = '0a6a1a74802bc9ef8c5ce3d7a4a472d9f69c67c08a66337f30f4321f7f00fcaf' %}
{% set version = '2.0.0.49' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

logfileparser-download-only:
  file.managed:
    - name: '{{ downloads }}\LogFileParser_v{{ version }}.zip'
    - source: https://github.com/jschicht/LogFileParser/releases/download/v{{ version }}/LogFileParser_v{{ version }}.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
