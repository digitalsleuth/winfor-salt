# Name: FTK Imager
# Website: https://www.exterro.com
# Description: Forensic Image Acquisition and Triage tool
# Category: Acquisition and Analysis
# Author: Exterro Inc / AccessData
# License: EULA
# Version: 4.7.3.81
# Notes:

{% set version = '4.7.3.81' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'ftk-imager-'~ version ~'.exe' %}
{% set exists = salt['file.file_exists'](downloads + '\\ftk-imager\\' + pkg) %}

{% if exists %}
ftk-imager-install-offline:
  cmd.run:
    - name: '{{ pkg }} /s /v/qn'
    - shell: cmd
    - cwd: '{{ downloads }}\ftk-imager\'

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
