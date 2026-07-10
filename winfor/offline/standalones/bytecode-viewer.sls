# Name: Bytecode Viewer
# Website: https://github.com/konloch/bytecode-viewer
# Description: Android APK reverse engineering suite
# Category: Mobile Analysis
# Author: Konloch
# License: GNU General Public License v3 (https://github.com/Konloch/bytecode-viewer/blob/master/LICENSE)
# Version: 2.12
# Notes: 

{% set version = '2.12' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set pkg = 'bytecode-viewer-'~ version ~'.jar' %}
{% set exists = salt['file.file_exists'](downloads + '\\bytecode-viewer\\' + pkg) %}

{% if exists %}

include:
  - winfor.offline.packages.jdk17

bytecode-viewer-offline:
  file.managed:
    - name: '{{ inpath }}\bytecode-viewer\bytecode-viewer.jar'
    - source: '{{ downloads }}\bytecode-viewer\{{ pkg }}'
    - skip_verify: True
    - makedirs: True

bytecode-viewer-shortcut-offline:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\Bytecode Viewer.lnk'
    - target: '{{ inpath }}\bytecode-viewer\bytecode-viewer.jar'
    - force: True
    - working_dir: '{{ inpath }}\bytecode-viewer\'
    - makedirs: True
    - require:
      - file: bytecode-viewer-offline
      - sls: winfor.offline.packages.jdk17

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
