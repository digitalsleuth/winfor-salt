# Name: apktool
# Website: https://apktool.org/
# Description: A tool for reverse engineering Android apk files
# Category: Mobile Analysis
# Author: Connor Tumbleson et al (https://github.com/iBotPeaches/Apktool/blob/master/CONTRIBUTORS.md)
# License: Apache License v2 (https://github.com/iBotPeaches/Apktool/blob/master/LICENSE.md)
# Version: 2.8.1
# Notes: JAR file, requires Java

{% set version = '2.8.1' %}
{% set batch_hash = '3e1c29f9d2c7b3a7c938573f4c2ae61172f6221dc9febfa85080f354357d6336' %}
{% set jar_hash = '7b4a8e1703e228d206db29644b71141687d8a111b55b039b08b02dfa443ab0f9' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

apktool-batch-download-only:
  file.managed:
    - name: '{{ downloads }}\apktool.bat'
    - source: https://raw.githubusercontent.com/iBotPeaches/Apktool/master/scripts/windows/apktool.bat
    - source_hash: sha256={{ batch_hash }}
    - makedirs: True

apktool-jar-download-only:
  file.managed:
    - name: '{{ downloads }}\apktool.jar'
    - source: https://bitbucket.org/iBotPeaches/apktool/downloads/apktool_{{ version }}.jar
    - source_hash: sha256={{ jar_hash }}
    - makedirs: True
    - require:
      - file: apktool-batch-download-only
