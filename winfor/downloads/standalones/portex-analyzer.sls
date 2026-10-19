# Name: PortexAnalyzer GUI
# Website: https://github.com/struppigel/PortexAnalyzerGUI
# Description: GUI for PortEx, a Portable Executable and Malware Analysis Library
# Category: Executables
# Author: Karsten Hahn
# License: Apache License 2.0 (https://github.com/struppigel/PortexAnalyzerGUI/blob/main/LICENSE)
# Version: 1.0.0
# Notes:

{% set version = '1.0.0' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set hash = '5ba52546a31a1fc99effcec44f9143ae1207ac019b9719908da09dac53778ba3' %}

portex-analyzer-download-only:
  file.managed:
    - name: '{{ downloads }}\portex-analyzer\portex-analyzer-{{ version }}.jar'
    - source: https://github.com/struppigel/PortexAnalyzerGUI/releases/download/v{{ version }}/PortexAnalyzerGUI-{{ version }}-jar-with-dependencies.jar
    - source_hash: sha256={{ hash }}
    - makedirs: True
