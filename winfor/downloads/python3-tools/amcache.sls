# Name: amcache.py
# Website: Original (https://github.com/williballenthin/python-registry)
# Description: AmCache Registry Hive Parser
# Category: Windows Analysis
# Author: Willi Ballenthin and Corey Forman
# License: Apache License 2.0 (https://github.com/williballenthin/python-registry/blob/master/LICENSE.TXT)
# Version: 2.0
# Notes: This version has been modified from the original, and is not stored online at this time

{% set version = '2.0' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

amcache-file-copy-download-only:
  file.managed:
    - name: '{{ downloads }}\amcache\amcache-{{ version }}.py'
    - source: salt://winfor/files/amcache.py
    - skip_verify: True
    - makedirs: True
