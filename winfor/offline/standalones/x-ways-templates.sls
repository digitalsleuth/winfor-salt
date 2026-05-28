# Name: X-Ways Forensics Templates
# Website: https://github.com/digitalsleuth/xways-templates
# Description: Templates for X-Ways Templates
# Category: Acquisition and Analysis
# Author: Community Driven (multiple authors)
# License:
# Version: 0.0.2
# Notes:

{% set version = '0.0.2' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}

xways-templates-extract-offline:
  archive.extracted:
    - name: '{{ inpath }}\xwf\'
    - source: '{{ downloads }}\x-ways\xways-templates-non-standard-v{{ version }}.zip'
    - enforce_toplevel: False
    - overwrite: True
