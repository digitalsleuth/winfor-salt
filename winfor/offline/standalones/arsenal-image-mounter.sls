# Name: Arsenal Image Mounter
# Website: https://arsenalrecon.com
# Description: Forensic Image Mounter
# Category: Acquisition and Analysis
# Author: Arsenal Recon
# License: https://github.com/ArsenalRecon/Arsenal-Image-Mounter/blob/master/LICENSE.md
# Version: 3.12.344
# Notes:

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set hash = 'ee555a8aa3aab69a77c5ed21e06371e2d25105981920fd8a734abee057102878' %}
{% set version = '3.12.344' %}
{% set file_value = 'btJD1aKb#XXpSbOPYYsgOmImoI6C0hp3orF8I4TfNuge7pYkg-qU' %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

include:
  - winfor.offline.packages.dotnet10-desktop-runtime

arsenal-extract-offline:
  archive.extracted:
    - name: '{{ inpath }}\'
    - enforce_toplevel: True
    - source: '{{ downloads }}\arsenal-image-mounter\Arsenal-Image-Mounter-v{{ version }}.zip'
    - source_hash: sha256={{ hash }}
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

