# Name: Noriben
# Website: https://github.com/rurik/noriben
# Description: Malware Analysis Sandbox based on Python
# Category: Executables
# Author: Brian Baskin (Rurik)
# License: Apache License v2 (https://github.com/Rurik/Noriben/blob/master/LICENSE)
# Version: 2.0.1
# Notes: 

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set version = '2.0.1' %}

include:
  - winfor.packages.git
  - winfor.packages.python3

noriben-clone:
  git.latest:
    - name: https://github.com/rurik/noriben
    - target: '{{ inpath }}\noriben'
    - rev: master
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

noriben-env-vars:
  win_path.exists:
    - name: '{{ inpath }}\noriben\'
