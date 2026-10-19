# Name: apktool
# Website: https://apktool.org/
# Description: A tool for reverse engineering Android apk files
# Category: Mobile Analysis
# Author: Connor Tumbleson et al (https://github.com/iBotPeaches/Apktool/blob/main/CONTRIBUTORS.md)
# License: Apache License v2 (https://github.com/iBotPeaches/Apktool/blob/main/LICENSE.md)
# Version: 3.0.3
# Notes: JAR file, requires Java

{% set version = '3.0.3' %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set batch_hash = get_hash('apktool', 'batch_hash') %}
{% set hash = get_hash('apktool', 'hash') %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

apktool-batch-download-only:
  file.managed:
    - name: '{{ downloads }}\apktool\apktool-{{ version }}.bat'
    - source: https://raw.githubusercontent.com/iBotPeaches/Apktool/main/scripts/windows/apktool.bat
    - source_hash: sha256={{ batch_hash }}
    - makedirs: True

apktool-jar-download-only:
  file.managed:
    - name: '{{ downloads }}\apktool\apktool-{{ version }}.jar'
    - source: https://github.com/iBotPeaches/Apktool/releases/download/v{{ version }}/apktool_{{ version }}.jar
    - source_hash: sha256={{ hash }}
    - makedirs: True
    - require:
      - file: apktool-batch-download-only
