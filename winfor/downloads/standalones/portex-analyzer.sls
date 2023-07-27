# Name: PortexAnalyzer GUI
# Website: https://github.com/struppigel/PortexAnalyzerGUI
# Description: GUI for PortEx, a Portable Executable and Malware Analysis Library
# Category: Executables
# Author: Karsten Hahn
# License: Apache License 2.0 (https://github.com/struppigel/PortexAnalyzerGUI/blob/main/LICENSE)
# Version: 0.12.10
# Notes:

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '0.12.10' %}
{% set hash = '75e20bea06a688c271b0411005c8406f63df32791a5d42bce7c35eeeb964796b' %}

portex-analyzer-download-only:
  file.managed:
    - name: '{{ downloads }}\PortexAnalyzer\PortexAnalyzerGUI-{{ version }}-jar-with-dependencies.jar'
    - source: https://github.com/struppigel/PortexAnalyzerGUI/releases/download/{{ version }}/PortexAnalyzerGUI-{{ version }}-jar-with-dependencies.jar
    - source_hash: sha256={{ hash }}
    - makedirs: True
