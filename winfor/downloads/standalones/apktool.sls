# Name: apktool
# Website: https://apktool.org/
# Description: A tool for reverse engineering Android apk files
# Category: Mobile Analysis
# Author: Connor Tumbleson et al (https://github.com/iBotPeaches/Apktool/blob/main/CONTRIBUTORS.md)
# License: Apache License v2 (https://github.com/iBotPeaches/Apktool/blob/main/LICENSE.md)
# Version: 3.0.3
# Notes: JAR file, requires Java

{% set version = '3.0.3' %}
{% set batch_hash = '9440ec9d98efdef14136f4cefd79ac200d72baa016b5991d128234a3a3ef3b43' %}
{% set hash = 'dbf930b076c6b9be08d57c449cacefc3bdd6b71ebd59b3066fc0e1f5b14f9423' %}
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
