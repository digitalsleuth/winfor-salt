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
{% set files = ['Noriben', 'NoribenSandbox', 'NoribenRead'] %}

include:
  - winfor.packages.git
  - winfor.packages.python3

noriben-clone:
  git.latest:
    - name: https://github.com/rurik/noriben
    - target: '{{ inpath }}\noriben'
    - rev: main
    - force_clone: True
    - force_reset: True
    - require:
      - sls: winfor.packages.git

noriben-header:
  file.prepend:
    - name: '{{ inpath }}\noriben\Noriben.py'
    - text: '#!/usr/bin/python3'
    - require:
      - git: noriben-clone
      - sls: winfor.packages.python3

{% for file in files %}
noriben-wrapper-{{ file }}:
  file.managed:
    - name: 'C:\Program Files\Python310\Scripts\{{ file }}.cmd'
    - win_inheritance: True
    - contents:
      - '@echo off'
      - '"C:\Program Files\Python310\python.exe" "{{ inpath }}\noriben\{{ file }}.py" %*'
    - require:
      - sls: winfor.packages.python3
{% endfor %}
