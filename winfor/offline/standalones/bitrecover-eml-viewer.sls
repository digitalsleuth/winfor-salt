# Name: BitRecover EML File Viewer
# Website: https://www.bitrecover.com
# Description: EML file viewer
# Category: Email
# Author: BitRecover
# License: EULA - https://www.bitrecover.com/terms.html
# Version: 5.0
# Notes:

{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set version = '5.0' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

bitrecover-eml-viewer-offline:
  file.managed:
    - name: '{{ inpath }}\bitrecover-eml-viewer\bitrecover-eml-viewer.exe'
    - source: '{{ downloads }}\bitrecover-eml-viewer\bitrecover-eml-viewer-{{ version }}.exe'
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
