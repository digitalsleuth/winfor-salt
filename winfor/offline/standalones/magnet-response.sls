# Name: Magnet RESPONSE
# Website: https://magnetforensics.com
# Description: Tool to collect data relevant to incident response investigations
# Category: Acquisition and Analysis
# Author: Magnet Forensics
# License: EULA
# Version: 1.72
# Notes:

{% set version = '1.72' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'magnet-response-'~ version ~'.exe' %}
{% set exists = salt['file.file_exists'](downloads + '\\magnetforensics\\' + pkg) %}

{% if exists %}

magnet-response-extract-offline:
  cmd.run:
    - name: '{{ downloads }}\magnetforensics\magnet-response-{{ version }}.exe -o{{ inpath }}\magnet\response\ -y'
    - shell: cmd

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
