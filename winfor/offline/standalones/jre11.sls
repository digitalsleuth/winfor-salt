# Name: Eclipse Temurin
# Website: https://adoptium.net/temurin/
# Description: Open JDK JRE by Adoptium
# Category: Requirements
# Author: Adoptium
# License: Eclipse Public License v2 (https://www.eclipse.org/legal/epl-2.0/)
# Version: 11.0.31
# Notes:

{% set version = '11.0.31' %}
{% set subversion = '11' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'jre11-'~ version ~'.zip' %}
{% set exists = salt['file.file_exists'](downloads + '\\jre11\\' + pkg) %}

{% if exists %}

jre11-extract-offline:
  archive.extracted:
    - name: '{{ inpath }}\'
    - source: '{{ downloads }}\jre11\{{ pkg }}'
    - enforce_toplevel: False

jre11-folder-rename-offline:
  file.rename:
    - name: '{{ inpath }}\jre11'
    - source: '{{ inpath }}\jdk-{{ version }}+{{ subversion }}-jre\'
    - force: True
    - require:
      - archive: jre11-extract-offline

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
