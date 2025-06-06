# Name: PortexAnalyzer GUI
# Website: https://github.com/struppigel/PortexAnalyzerGUI
# Description: GUI for PortEx, a Portable Executable and Malware Analysis Library
# Category: Executables
# Author: Karsten Hahn
# License: Apache License 2.0 (https://github.com/struppigel/PortexAnalyzerGUI/blob/main/LICENSE)
# Version: 0.13.2
# Notes:

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set version = '0.13.2' %}
{% set hash = '9fd5d6d43c7bc698b148db354366e884f6464136c552fd7fd97c15773ceeaece' %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

include:
  - winfor.packages.jdk17

portex-analyzer-download:
  file.managed:
    - name: '{{ inpath }}\portexanalyzer\PortexAnalyzerGUI-{{ version }}-jar-with-dependencies.jar'
    - source: https://github.com/struppigel/PortexAnalyzerGUI/releases/download/{{ version }}/PortexAnalyzerGUI-{{ version }}-jar-with-dependencies.jar
    - source_hash: sha256={{ hash }}
    - makedirs: True

standalones-portex-analyzer-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\Portex Analyzer.lnk'
    - target: '{{ inpath }}\portexanalyzer\PortexAnalyzerGUI-{{ version }}-jar-with-dependencies.jar'
    - force: True
    - working_dir: '{{ inpath }}\portexanalyzer\'
    - makedirs: True
    - require:
      - file: portex-analyzer-download
      - sls: winfor.packages.jdk17
