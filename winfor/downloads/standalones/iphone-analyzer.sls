# Name: iphoneanalyzer (iPhone Analyzer)
# Website: https://sourceforge.net/project/iphoneanalyzer/
# Description: Analyze iPhone backups
# Category: Mobile Analysis
# Author: leocrawford, matproud
# License: GNU General Public License v3 (https://sourceforge.net/directory/os:linux/license:gplv3/)
# Version: 2.1.0
# Notes: 

{% set version = '2.1.0' %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('iphone-analyzer') %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

iphone-analyzer-download-only:
  file.managed:
    - name: '{{ downloads }}\iphone-analyzer\iphoneanalyzer-{{ version }}.jar'
    - source: "https://deac-fra.dl.sourceforge.net/project/iphoneanalyzer/executable%20jar%20builds/iphoneanalyzer.fat.gui-{{ version }}.jar"
    - source_hash: sha256={{ hash }}
    - makedirs: True
