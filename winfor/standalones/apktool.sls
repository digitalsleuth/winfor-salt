# Name: apktool
# Website: https://apktool.org/
# Description: A tool for reverse engineering Android apk files
# Category: Mobile Analysis
# Author: Connor Tumbleson et al (https://github.com/iBotPeaches/Apktool/blob/master/CONTRIBUTORS.md)
# License: Apache License v2 (https://github.com/iBotPeaches/Apktool/blob/master/LICENSE.md)
# Version: 2.12.1
# Notes: JAR file, requires Java

{% set version = '2.12.1' %}
{% set batch_hash = 'b27150908edde47533463e4a3cc518541b253b2a7bf16f21d0df33646afce8d3' %}
{% set jar_hash = '66cf4524a4a45a7f56567d08b2c9b6ec237bcdd78cee69fd4a59c8a0243aeafa' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}

include:
  - winfor.repos
  - winfor.packages.jdk17

apktool-batch-download:
  file.managed:
    - name: '{{ inpath }}\apktool\apktool.bat'
    - source: https://raw.githubusercontent.com/iBotPeaches/Apktool/master/scripts/windows/apktool.bat
    - source_hash: sha256={{ batch_hash }}
    - makedirs: True

apktool-jar-download:
  file.managed:
    - name: '{{ inpath }}\apktool\apktool.jar'
    - source: https://github.com/iBotPeaches/Apktool/releases/download/v{{ version }}/apktool_{{ version }}.jar
    - source_hash: sha256={{ jar_hash }}
    - makedirs: True
    - require:
      - file: apktool-batch-download
      - sls: winfor.repos
      - sls: winfor.packages.jdk17

apktool-path:
  win_path.exists:
    - name: '{{ inpath }}\apktool'
    - require:
      - file: apktool-jar-download
