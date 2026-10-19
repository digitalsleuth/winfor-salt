# Name: Eclipse Temurin
# Website: https://adoptium.net/temurin/
# Description: Open JDK JRE by Adoptium
# Category: Requirements
# Author: Adoptium
# License: Eclipse Public License v2 (https://www.eclipse.org/legal/epl-2.0/)
# Version: 11.0.31
# Notes:

{% set version = '11.0.31' %}
{% set major = '11' %}
{% set subversion = '11' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('jre11') %}

jre11-download-only:
  file.managed:
    - name: '{{ downloads }}\jre11\jre11-{{ version }}.zip'
    - source: https://github.com/adoptium/temurin{{ major }}-binaries/releases/download/jdk-{{ version }}%2B{{ subversion }}/OpenJDK{{ major }}U-jre_x64_windows_hotspot_{{ version }}_{{ subversion }}.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
