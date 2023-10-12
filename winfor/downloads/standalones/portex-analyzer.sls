# Name: PortexAnalyzer GUI
# Website: https://github.com/struppigel/PortexAnalyzerGUI
# Description: GUI for PortEx, a Portable Executable and Malware Analysis Library
# Category: Executables
# Author: Karsten Hahn
# License: Apache License 2.0 (https://github.com/struppigel/PortexAnalyzerGUI/blob/main/LICENSE)
# Version: 0.12.12
# Notes:

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '0.12.12' %}
{% set hash = '493660fee06e5b16ee10a2cb7e40743b18b2b39e9b97bfbea05d08932d1a56af' %}

portex-analyzer-download-only:
  file.managed:
    - name: '{{ downloads }}\portex-analyzer\PortexAnalyzerGUI-{{ version }}-jar-with-dependencies.jar'
    - source: https://github.com/struppigel/PortexAnalyzerGUI/releases/download/{{ version }}/PortexAnalyzerGUI-{{ version }}-jar-with-dependencies.jar
    - source_hash: sha256={{ hash }}
    - makedirs: True
