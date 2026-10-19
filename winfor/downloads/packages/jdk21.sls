# Name: Java Development Kit and Runtime Environment
# Website: https://www.java.com
# Description: Java Engine
# Category: Requirements
# Author: Oracle
# License: https://www.oracle.com/legal/terms.html
# Version: 21.0.7
# Notes: 

{% set version = '21.0.7' %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('jdk21') %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

jdk21-download-only:
  file.managed:
    - name: '{{ downloads }}\jdk21\jdk-{{ version }}.exe'
    - source: https://download.oracle.com/java/21/archive/jdk-{{ version }}_windows-x64_bin.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
