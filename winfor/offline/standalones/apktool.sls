# Name: apktool
# Website: https://apktool.org/
# Description: A tool for reverse engineering Android apk files
# Category: Mobile Analysis
# Author: Connor Tumbleson et al (https://github.com/iBotPeaches/Apktool/blob/master/CONTRIBUTORS.md)
# License: Apache License v2 (https://github.com/iBotPeaches/Apktool/blob/master/LICENSE.md)
# Version: 2.12.1
# Notes: JAR file, requires Java

{% set version = '2.12.1' %}
{% set batch_hash = 'd81a91bd694459a61a88e4a1a8184efc21130390ff7cb5c172f631551ad9842a' %}
{% set jar_hash = '66cf4524a4a45a7f56567d08b2c9b6ec237bcdd78cee69fd4a59c8a0243aeafa' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}

include:
  - winfor.offline.packages.jdk17

apktool-batch-offline:
  file.managed:
    - name: '{{ inpath }}\apktool\apktool.bat'
    - source: '{{ downloads }}\apktool\apktool-{{ version }}.bat'
    - makedirs: True

apktool-jar-offline:
  file.managed:
    - name: '{{ inpath }}\apktool\apktool.jar'
    - source: '{{ downloads }}\apktool\apktool-{{ version }}.jar'
    - makedirs: True
    - require:
      - file: apktool-batch-offline

apktool-path-offline:
  win_path.exists:
    - name: '{{ inpath }}\apktool'
    - require:
      - file: apktool-jar-offline
