# Name: PortexAnalyzer GUI
# Website: https://github.com/struppigel/PortexAnalyzerGUI
# Description: GUI for PortEx, a Portable Executable and Malware Analysis Library
# Category: Executables
# Author: Karsten Hahn
# License: Apache License 2.0 (https://github.com/struppigel/PortexAnalyzerGUI/blob/main/LICENSE)
# Version: 0.12.10
# Notes:

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set version = '0.12.10' %}
{% set hash = '75e20bea06a688c271b0411005c8406f63df32791a5d42bce7c35eeeb964796b' %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

include:
  - winfor.installers.jre8

portex-analyzer-download:
  file.managed:
    - name: '{{ inpath }}\PortexAnalyzer\PortexAnalyzerGUI-{{ version }}-jar-with-dependencies.jar'
    - source: https://github.com/struppigel/PortexAnalyzerGUI/releases/download/{{ version }}/PortexAnalyzerGUI-{{ version }}-jar-with-dependencies.jar
    - source_hash: sha256={{ hash }}
    - makedirs: True

standalones-portex-analyzer-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\Portex Analyzer.lnk'
    - target: '{{ inpath }}\PortexAnalyzer\PortexAnalyzerGUI-{{ version }}-jar-with-dependencies.jar'
    - force: True
    - working_dir: '{{ inpath }}\PortexAnalyzer\'
    - makedirs: True
    - require:
      - file: portex-analyzer-download
      - sls: winfor.installers.jre8
