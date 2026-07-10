# Name: apktool
# Website: https://apktool.org/
# Description: A tool for reverse engineering Android apk files
# Category: Mobile Analysis
# Author: Connor Tumbleson et al (https://github.com/iBotPeaches/Apktool/blob/master/CONTRIBUTORS.md)
# License: Apache License v2 (https://github.com/iBotPeaches/Apktool/blob/master/LICENSE.md)
# Version: 2.12.1
# Notes: JAR file, requires Java

{% set version = '2.12.1' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'apktool-'~ version ~'.jar' %}
{% set exists = salt['file.file_exists'](downloads + '\\apktool\\' + pkg) %}

{% if exists %}

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

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
