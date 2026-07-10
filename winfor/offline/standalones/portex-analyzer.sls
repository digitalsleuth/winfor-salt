# Name: PortexAnalyzer GUI
# Website: https://github.com/struppigel/PortexAnalyzerGUI
# Description: GUI for PortEx, a Portable Executable and Malware Analysis Library
# Category: Executables
# Author: Karsten Hahn
# License: Apache License 2.0 (https://github.com/struppigel/PortexAnalyzerGUI/blob/main/LICENSE)
# Version: 0.13.2
# Notes:

{% set version = '0.13.2' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set pkg = 'portex-analyzer-'~ version ~'.jar' %}
{% set exists = salt['file.file_exists'](downloads + '\\portex-analyzer\\' + pkg) %}

{% if exists %}

include:
  - winfor.offline.packages.jdk17

portex-analyzer-copy-offline:
  file.managed:
    - name: '{{ inpath }}\portex-analyzer\portex-analyzer.jar'
    - source: '{{ downloads }}\portex-analyzer\{{ pkg }}'
    - makedirs: True
    - force: True

portex-analyzer-shortcut-offline:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\Portex Analyzer.lnk'
    - target: '{{ inpath }}\portex-analyzer\portex-analyzer.jar'
    - force: True
    - working_dir: '{{ inpath }}\portex-analyzer\'
    - makedirs: True
    - require:
      - sls: winfor.offline.packages.jdk17
      - file: portex-analyzer-copy-offline

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
