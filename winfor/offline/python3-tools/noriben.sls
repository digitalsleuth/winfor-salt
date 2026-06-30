# Name: Noriben
# Website: https://github.com/rurik/noriben
# Description: Malware Analysis Sandbox based on Python
# Category: Executables
# Author: Brian Baskin (Rurik)
# License: Apache License v2 (https://github.com/Rurik/Noriben/blob/master/LICENSE)
# Version: 2.0.4
# Notes: 

{% set version = '2.0.4' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set files = ['Noriben', 'NoribenSandbox', 'NoribenRead'] %}
{% set pkg = 'Noriben.py' %}
{% set exists = salt['file.file_exists'](downloads + '\\noriben\\' + pkg) %}

{% if exists %}

include:
  - winfor.offline.packages.python3

noriben-folder-rename-offline:
  file.rename:
    - name: '{{ inpath }}\noriben'
    - source: '{{ downloads }}\noriben'
    - makedirs: True
    - force: True
    - require:
      - sls: winfor.offline.packages.python3

{% for file in files %}
noriben-wrapper-offline-{{ file }}:
  file.managed:
    - name: 'C:\Program Files\Python310\Scripts\{{ file }}.cmd'
    - win_inheritance: True
    - contents:
      - '@echo off'
      - 'python3 "{{ inpath }}\noriben\{{ file }}.py" %*'
    - require:
      - sls: winfor.offline.packages.python3
      - file: noriben-folder-rename-offline
{% endfor %}

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
