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
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

include:
  - winfor.offline.packages.jdk21

iphone-analyzer-offline:
  file.managed:
    - name: '{{ inpath }}\iphone-analyzer\iphoneanalyzer.jar'
    - source: '{{ downloads }}\iphone-analyzer\iphoneanalyzer.fat.gui-{{ version }}.jar'
    - skip_verify: True
    - makedirs: True
    - require:
      - sls: winfor.offline.packages.jdk21

iphone-analyzer-shortcut-offline:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\iPhoneAnalyzer.lnk'
    - target: '{{ inpath }}\iphone-analyzer\iphoneanalyzer.jar'
    - force: True
    - working_dir: '{{ inpath }}\iphone-analyzer\'
    - makedirs: True
