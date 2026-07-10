# Name: Magnet RAM Capture (MRC)
# Website: https://magnetforensics.com
# Description: Windows memory capture utility
# Category: Acquisition and Analysis
# Author: Magnet Forensics
# License: EULA
# Version: 1.2.0
# Notes: 

{% set version = '1.2.0' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'magnet-ram-capture-'~ version ~'.exe' %}
{% set exists = salt['file.file_exists'](downloads + '\\magnetforensics\\' + pkg) %}

{% if exists %}

magnet-ram-capture-offline:
  file.managed:
    - name: '{{ inpath }}\magnet\RAMCapture\magnet-ram-capture.exe'
    - source: '{{ downloads }}\magnetforensics\{{ pkg }}'
    - skip_verify: True
    - makedirs: True

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
