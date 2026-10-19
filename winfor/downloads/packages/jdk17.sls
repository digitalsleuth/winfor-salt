# Name: Java Development Kit and Runtime Environment
# Website: https://www.java.com
# Description: Java Engine
# Category: Requirements
# Author: Oracle
# License: https://www.oracle.com/legal/terms.html
# Version: 17.0.9
# Notes: 

{% set version = '17.0.9' %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('jdk17') %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

jdk17-download-only:
  file.managed:
    - name: '{{ downloads }}\jdk17\jdk-{{ version }}.exe'
    - source: https://download.oracle.com/java/17/archive/jdk-{{ version }}_windows-x64_bin.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True

