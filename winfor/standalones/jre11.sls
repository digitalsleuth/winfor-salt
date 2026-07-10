# Name: Eclipse Temurin
# Website: https://adoptium.net/temurin/
# Description: Open JDK JRE by Adoptium
# Category: Requirements
# Author: Adoptium
# License: Eclipse Public License v2 (https://www.eclipse.org/legal/epl-2.0/)
# Version: 11.0.31
# Notes:

{% set version = '11.0.31' %}
{% set major = '11' %}
{% set subversion = '11' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set hash = '0af0760609eca44502f05e6ab4701eecbf85290f31278dabc41dceddab7237ab' %}

jre11-download:
  file.managed:
    - name: 'C:\salt\tempdownload\openjdk-{{ major }}-jre.zip'
    - source: https://github.com/adoptium/temurin{{ major }}-binaries/releases/download/jdk-{{ version }}%2B{{ subversion }}/OpenJDK{{ major }}U-jre_x64_windows_hotspot_{{ version }}_{{ subversion }}.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

jre11-extract:
  archive.extracted:
    - name: '{{ inpath }}\'
    - source: 'C:\salt\tempdownload\openjdk-{{ major }}-jre.zip'
    - enforce_toplevel: False
    - require:
      - file: jre11-download

jre11-folder-rename:
  file.rename:
    - name: '{{ inpath }}\jre11'
    - source: '{{ inpath }}\jdk-{{ version }}+{{ subversion }}-jre\'
    - force: True
    - require:
      - archive: jre11-extract
