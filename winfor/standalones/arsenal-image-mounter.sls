# Name: Arsenal Image Mounter
# Website: https://arsenalrecon.com
# Description: Forensic Image Mounter
# Category: Acquisition and Analysis
# Author: Arsenal Recon
# License: https://github.com/ArsenalRecon/Arsenal-Image-Mounter/blob/master/LICENSE.md
# Version: 3.11.306
# Notes:

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set hash = '0ece98dcede979399ab449dd8f4f76e6c8fd8ab4cd95980ebae5ba1a9ded13f1' %}
{% set version = '3.11.306' %}
{% set file_value = 'voJnEATD#1Pbc6A3mpBw2LlDt6pEj2bRUX69nqeX0YPqIkf5Cgho' %}
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

