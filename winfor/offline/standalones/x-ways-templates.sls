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
{% set pkg = 'xways-templates-'~ version ~'.zip' %}
{% set exists = salt['file.file_exists'](downloads + '\\xways-templates\\' + pkg) %}

{% if exists %}

xways-templates-extract-offline:
  archive.extracted:
    - name: '{{ inpath }}\xwf\'
    - source: '{{ downloads }}\x-ways\{{ pkg }}'
    - enforce_toplevel: False
    - overwrite: True

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}