# Name: LogFileParser
# Website: https://github.com/jschicht/LogFileParser
# Description: NTFS $LogFile Parser
# Category: Windows Analysis
# Author: Joakim Schicht
# License: MIT (https://github.com/jschicht/LogFileParser/blob/master/LICENSE.md)
# Version: 2.0.0.50
# Notes: 

{% set hash = '92fe01ffcc76ce9ab5c579dfa37f9cfcb5d705250c99c09b948f66702eae1eec' %}
{% set version = '2.0.0.50' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

logfileparser-download-only:
  file.managed:
    - name: '{{ downloads }}\LogFileParser_v{{ version }}.zip'
    - source: https://github.com/jschicht/LogFileParser/releases/download/v{{ version }}/LogFileParser_v{{ version }}.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
