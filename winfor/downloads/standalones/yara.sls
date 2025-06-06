# Name: YARA
# Website: https://virustotal.github.io/yara
# Description: Pattern Matching analysis tool
# Category: Utilities
# Author: VirusTotal (https://github.com/VirusTotal/yara/blob/master/AUTHORS)
# License: BSD 3-Clause (https://github.com/VirusTotal/yara/blob/master/COPYING)
# Version: 4.5.4
# Notes:

{% set version = '4.5.4' %}
{% set subversion = '' %}
{% set hash = '1981616eddb144d37a5e2b1f27ad80ca436af4bb0c04ed58e959f5fcd045cc00' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

yara-download-only:
  file.managed:
    - name: '{{ downloads }}\yara\yara-master-v{{ version }}-win64.zip'
    - source: https://github.com/VirusTotal/yara/releases/download/v{{ version }}/yara-master-v{{ version }}-win64.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
