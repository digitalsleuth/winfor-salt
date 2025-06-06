# Name: Java Development Kit and Runtime Environment
# Website: https://www.java.com
# Description: Java Engine
# Category: Requirements
# Author: Oracle
# License: https://www.oracle.com/legal/terms.html
# Version: 21.0.7
# Notes: 

{% set version = '21.0.7' %}
{% set hash = '3421fbe8b787fb15aba45ae081237e6a3b3e761a966dbaeaf6cafc370419a508' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

jdk21-download-only:
  file.managed:
    - name: '{{ downloads }}\jdk21\jdk-{{ version }}_windows-x64_bin.exe'
    - source: https://download.oracle.com/java/21/archive/jdk-{{ version }}_windows-x64_bin.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
