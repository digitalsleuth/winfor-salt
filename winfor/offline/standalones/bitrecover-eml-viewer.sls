# Name: BitRecover EML File Viewer
# Website: https://www.bitrecover.com
# Description: EML file viewer
# Category: Email
# Author: BitRecover
# License: EULA - https://www.bitrecover.com/terms.html
# Version: 5.0
# Notes:

{% set version = '5.0' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set pkg = 'bitrecover-eml-viewer-'~ version ~'.exe' %}
{% set exists = salt['file.file_exists'](downloads + '\\bitrecover-eml-viewer\\' + pkg) %}

{% if exists %}

bitrecover-eml-viewer-offline:
  file.managed:
    - name: '{{ inpath }}\bitrecover-eml-viewer\bitrecover-eml-viewer.exe'
    - source: '{{ downloads }}\bitrecover-eml-viewer\{{ pkg }}'
    - skip_verify: True
    - makedirs: True

bitrecover-shortcut-offline:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\BitRecover EML Viewer.lnk'
    - target: '{{ inpath }}\bitrecover-eml-viewer\bitrecover-eml-viewer.exe'
    - force: True
    - working_dir: '{{ inpath }}\bitrecover-eml-viewer\'
    - makedirs: True
    - require:
      - file: bitrecover-eml-viewer-offline

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
