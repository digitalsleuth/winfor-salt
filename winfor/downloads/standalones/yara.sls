# Name: YARA
# Website: https://virustotal.github.io/yara
# Description: Pattern Matching analysis tool
# Category: Utilities
# Author: VirusTotal (https://github.com/VirusTotal/yara/blob/master/AUTHORS)
# License: BSD 3-Clause (https://github.com/VirusTotal/yara/blob/master/COPYING)
# Version: 4.5.5
# Notes:

{% set version = '4.5.5' %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set subversion = get_hash('yara', 'subversion') %}
{% set hash = get_hash('yara') %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

yara-download-only:
  file.managed:
    - name: '{{ downloads }}\yara\yara-{{ version }}.zip'
    - source: https://github.com/VirusTotal/yara/releases/download/v{{ version }}/yara-{{ version }}-{{ subversion }}-win64.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
