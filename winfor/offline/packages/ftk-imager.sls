# Name: FTK Imager
# Website: https://www.exterro.com
# Description: Forensic Image Acquisition and Triage tool
# Category: Acquisition and Analysis
# Author: Exterro Inc / AccessData
# License: EULA
# Version: 8.3.0.27
# Notes:

{% set version = '8.3.0.27' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'ftk-imager-'~ version ~'.zip' %}
{% set exists = salt['file.file_exists'](downloads + '\\ftk-imager\\' + pkg) %}

{% if exists %}
ftk-imager-extract-offline:
  archive.extracted:
    - name: '{{ downloads }}\ftk-imager\'
    - source: '{{ downloads }}\ftk-imager\{{ pkg }}'
    - enforce_toplevel: False

ftk-imager-install-offline:
  cmd.run:
    - name: '"Exterro_FTK_Imager_(x64).exe" /s /v/qn'
    - cwd: '{{ downloads }}\ftk-imager\'
    - shell: cmd
    - require:
      - archive: ftk-imager-extract-offline

ftk-imager-icon-remove:
  file.absent:
    - name: 'C:\Users\Public\Desktop\Exterro FTK Imager.lnk'
    - require:
      - cmd: ftk-imager-install-offline


{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
