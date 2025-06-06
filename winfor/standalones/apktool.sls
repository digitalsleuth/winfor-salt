# Name: apktool
# Website: https://apktool.org/
# Description: A tool for reverse engineering Android apk files
# Category: Mobile Analysis
# Author: Connor Tumbleson et al (https://github.com/iBotPeaches/Apktool/blob/master/CONTRIBUTORS.md)
# License: Apache License v2 (https://github.com/iBotPeaches/Apktool/blob/master/LICENSE.md)
# Version: 2.11.1
# Notes: JAR file, requires Java

{% set version = '2.11.1' %}
{% set batch_hash = '3e1c29f9d2c7b3a7c938573f4c2ae61172f6221dc9febfa85080f354357d6336' %}
{% set jar_hash = '56d59c524fc764263ba8d345754d8daf55b1887818b15cd3b594f555d249e2db' %}
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
