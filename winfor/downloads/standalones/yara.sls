# Name: YARA
# Website: https://virustotal.github.io/yara
# Description: Pattern Matching analysis tool
# Category: Utilities
# Author: VirusTotal (https://github.com/VirusTotal/yara/blob/master/AUTHORS)
# License: BSD 3-Clause (https://github.com/VirusTotal/yara/blob/master/COPYING)
# Version: 4.3.2-2150
# Notes:

{% set version = '4.3.2' %}
{% set subversion = '2150' %}
{% set hash = 'd878593371a0cdc0946a26e460c3bf0a0964018647a0e2239b1dc25ddc0d2365' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

yara-download-only:
  file.managed:
    - name: '{{ downloads }}\yara\yara-{{ version }}-{{ subversion }}-win64.zip'
    - source: https://github.com/VirusTotal/yara/releases/download/v{{ version }}/yara-{{ version }}-{{ subversion }}-win64.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
