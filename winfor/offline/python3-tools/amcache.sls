# Name: amcache.py
# Website: Original (https://github.com/williballenthin/python-registry)
# Description: AmCache Registry Hive Parser
# Category: Windows Analysis
# Author: Willi Ballenthin and Corey Forman
# License: Apache License 2.0 (https://github.com/williballenthin/python-registry/blob/master/LICENSE.TXT)
# Version: 2.0
# Notes: This version has been modified from the original, and is not stored online at this time

{% set version = '2.0' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}

include:
  - winfor.offline.packages.python3

amcache-file-copy-offline:
  file.managed:
    - name: 'C:\Program Files\Python310\Scripts\amcache.py'
    - source: '{{ downloads }}\amcache\amcache-{{ version }}.py'
    - makedirs: True
    - require:
      - sls: winfor.offline.packages.python3

amcache-wrapper-offline:
  file.managed:
    - name: 'C:\Program Files\Python310\Scripts\amcache.cmd'
    - win_inheritance: True
    - contents:
      - '@echo off'
      - 'python3 "C:\Program Files\Python310\Scripts\amcache.py" %*'
    - require:
      - file: amcache-file-copy-offline
