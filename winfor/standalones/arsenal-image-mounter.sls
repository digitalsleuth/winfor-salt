# Name: Arsenal Image Mounter
# Website: https://arsenalrecon.com
# Description: Forensic Image Mounter
# Category: Acquisition and Analysis
# Author: Arsenal Recon
# License: https://github.com/ArsenalRecon/Arsenal-Image-Mounter/blob/master/LICENSE.md
# Version: 3.10.257
# Notes:

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set hash = '104b6b743ca4dcd3d2b67cf472bce7b365aff4c6af6d81fe9c95ab09619d0004' %}
{% set version = '3.10.257' %}
{% set file_value = 'rg5CXJoK#-rUdbyr1NQll0UrkVAIOQ5km8hD4qMwFIWat4U0OR60' %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

include:
  - winfor.standalones.megatools

arsenal-remove-previous:
  file.absent:
    - name: 'C:\salt\tempdownload\Arsenal-Image-Mounter-v{{ version }}.zip'

arsenal-download:
  cmd.run:
    - name: '{{ inpath }}\megatools\megatools.exe dl https://mega.nz/file/{{ file_value }} --path C:\salt\tempdownload'
    - shell: cmd
    - require:
      - sls: winfor.standalones.megatools
      - file: arsenal-remove-previous

arsenal-extract:
  archive.extracted:
    - name: '{{ inpath }}\'
    - enforce_toplevel: True
    - source: 'C:\salt\tempdownload\Arsenal-Image-Mounter-v{{ version }}.zip'
    - source_hash: sha256={{ hash }}
    - overwrite: True
    - require:
      - sls: winfor.standalones.megatools
      - cmd: arsenal-download

arsenal-folder-rename:
  file.rename:
    - name: '{{ inpath }}\arsenal'
    - source: '{{ inpath }}\Arsenal-Image-Mounter-v{{ version }}\'
    - force: True
    - makedirs: True
    - require:
      - archive: arsenal-extract

standalones-arsenal-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\Arsenal Image Mounter.lnk'
    - target: '{{ inpath }}\arsenal\ArsenalImageMounter.exe'
    - force: True
    - working_dir: '{{ inpath }}\arsenal\'
    - makedirs: True
    - require:
      - sls: winfor.standalones.megatools
      - cmd: arsenal-download
      - archive: arsenal-extract
      - file: arsenal-folder-rename

