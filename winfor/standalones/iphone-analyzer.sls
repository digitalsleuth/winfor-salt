# Name: iphoneanalyzer (iPhone Analyzer)
# Website: https://sourceforge.net/project/iphoneanalyzer/
# Description: Analyze iPhone backups
# Category: Mobile Analysis
# Author: leocrawford, matproud
# License: GNU General Public License v3 (https://sourceforge.net/directory/os:linux/license:gplv3/)
# Version: 2.1.0
# Notes: 

{% set version = '2.1.0' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('iphone-analyzer') %}

iphone-analyzer-download:
  file.managed:
    - name: '{{ inpath }}\iphone-analyzer\iphoneanalyzer.jar'
    - source: "https://deac-fra.dl.sourceforge.net/project/iphoneanalyzer/executable%20jar%20builds/iphoneanalyzer.fat.gui-{{ version }}.jar"
    - source_hash: sha256={{ hash }}
    - makedirs: True

iphone-analyzer-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\iPhoneAnalyzer.lnk'
    - target: '{{ inpath }}\iphone-analyzer\iphoneanalyzer.jar'
    - force: True
    - working_dir: '{{ inpath }}\iphone-analyzer\'
    - makedirs: True
