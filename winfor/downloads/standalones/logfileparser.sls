# Name: LogFileParser
# Website: https://github.com/jschicht/LogFileParser
# Description: NTFS $LogFile Parser
# Category: Windows Analysis
# Author: Joakim Schicht
# License: MIT (https://github.com/jschicht/LogFileParser/blob/master/LICENSE.md)
# Version: 2.0.0.53
# Notes: 

{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('logfileparser') %}
{% set version = '2.0.0.53' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

logfileparser-download-only:
  file.managed:
    - name: '{{ downloads }}\logfileparser\logfileparser-{{ version }}.zip'
    - source: https://github.com/jschicht/LogFileParser/releases/download/v{{ version }}/LogFileParser_v{{ version }}.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
