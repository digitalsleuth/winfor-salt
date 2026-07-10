# Name: Encrypted Disk Detector (EDD)
# Website: https://www.magnetforensics.com
# Description: Detects encrypted disks
# Category: Utilities
# Author: Magnet Forensics
# License: EULA
# Version: 310
# Notes: Standalone Utility

{% set version = '310' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'magnet-edd-'~ version ~'.zip' %}
{% set exists = salt['file.file_exists'](downloads + '\\magnetforensics\\' + pkg) %}

{% if exists %}

magnet-edd-extract-offline:
  archive.extracted:
    - name: '{{ inpath }}\magnet\EDD\'
    - source: '{{ downloads }}\magnetforensics\{{ pkg }}'
    - enforce_toplevel: False

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
