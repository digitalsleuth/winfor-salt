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
{% set pkg = 'iphoneanalyzer-'~ version ~'.jar' %}
{% set exists = salt['file.file_exists'](downloads + '\\iphone-analyzer\\' + pkg) %}

{% if exists %}

include:
  - winfor.offline.standalones.jre11

iphone-analyzer-offline:
  file.managed:
    - name: '{{ inpath }}\iphone-analyzer\iphoneanalyzer.jar'
    - source: '{{ downloads }}\iphone-analyzer\{{ pkg }}'
    - skip_verify: True
    - makedirs: True
    - require:
      - sls: winfor.offline.standalones.jre11

iphone-analyzer-shortcut-offline:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\iPhoneAnalyzer.lnk'
    - target: '{{ inpath }}\jre11\bin\javaw.exe'
    - arguments: '-jar {{ inpath }}\iphone-analyzer\iphoneanalyzer.jar'
    - working_dir: '{{ inpath }}\jre11\bin'
    - force: True
    - makedirs: True
    - require:
      - file: iphone-analyzer-offline
      - sls: winfor.offline.standalones.jre11

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
