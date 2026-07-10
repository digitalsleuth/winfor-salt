# Name: Arsenal Image Mounter
# Website: https://arsenalrecon.com
# Description: Forensic Image Mounter
# Category: Acquisition and Analysis
# Author: Arsenal Recon
# License: https://github.com/ArsenalRecon/Arsenal-Image-Mounter/blob/master/LICENSE.md
# Version: 3.12.344
# Notes:

{% set version = '3.12.344' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set pkg = 'arsenal-image-mounter-'~ version ~'.zip' %}
{% set exists = salt['file.file_exists'](downloads + '\\arsenal-image-mounter\\' + pkg) %}

{% if exists %}

include:
  - winfor.offline.packages.dotnet10-desktop-runtime

arsenal-extract-offline:
  archive.extracted:
    - name: '{{ inpath }}\'
    - enforce_toplevel: True
    - source: '{{ downloads }}\arsenal-image-mounter\{{ pkg }}'
    - overwrite: True
    - require:
      - sls: winfor.offline.packages.dotnet10-desktop-runtime

arsenal-folder-rename-offline:
  file.rename:
    - name: '{{ inpath }}\arsenal'
    - source: '{{ inpath }}\Arsenal-Image-Mounter-v{{ version }}\'
    - force: True
    - makedirs: True
    - require:
      - archive: arsenal-extract-offline

arsenal-shortcut-offline:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\Arsenal Image Mounter.lnk'
    - target: '{{ inpath }}\arsenal\ArsenalImageMounter.exe'
    - force: True
    - working_dir: '{{ inpath }}\arsenal\'
    - makedirs: True
    - require:
      - archive: arsenal-extract-offline
      - file: arsenal-folder-rename-offline

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
