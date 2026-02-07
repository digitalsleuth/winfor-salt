# Name: apktool
# Website: https://apktool.org/
# Description: A tool for reverse engineering Android apk files
# Category: Mobile Analysis
# Author: Connor Tumbleson et al (https://github.com/iBotPeaches/Apktool/blob/main/CONTRIBUTORS.md)
# License: Apache License v2 (https://github.com/iBotPeaches/Apktool/blob/main/LICENSE.md)
# Version: 2.12.1
# Notes: JAR file, requires Java

{% set version = '2.12.1' %}
{% set batch_hash = 'd81a91bd694459a61a88e4a1a8184efc21130390ff7cb5c172f631551ad9842a' %}
{% set jar_hash = '66cf4524a4a45a7f56567d08b2c9b6ec237bcdd78cee69fd4a59c8a0243aeafa' %}
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
    - source_hash: sha256={{ jar_hash }}
    - makedirs: True
    - require:
      - file: apktool-batch-download-only
