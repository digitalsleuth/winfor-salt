# Name: Arsenal Image Mounter
# Website: https://arsenalrecon.com
# Description: Forensic Image Mounter
# Category: Acquisition and Analysis
# Author: Arsenal Recon
# License: https://github.com/ArsenalRecon/Arsenal-Image-Mounter/blob/master/LICENSE.md
# Version: 3.9.228
# Notes:

{% set hash = 'f9b7095cf03ecf257884cb1d2d55d4514f730ca9961f5b029d6449c7fb6c098b' %}
{% set version = '3.9.228' %}
{% set file_value = 'e5YRlIDA#4CftLFHPEVWwXC_bib3a493BbF3VGJanAUVdPJc_5Gg' %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

include:
  - winfor.standalones.megatools

arsenal-remove-previous:
  file.absent:
    - name: 'C:\salt\tempdownload\Arsenal-Image-Mounter-v{{ version }}.zip'

arsenal-download:
  cmd.run:
    - name: 'C:\standalone\megatools\megatools.exe dl https://mega.nz/file/{{ file_value }} --path C:\salt\tempdownload'
    - shell: cmd
    - require:
      - sls: winfor.standalones.megatools
      - file: arsenal-remove-previous

arsenal-extract:
  archive.extracted:
    - name: 'C:\standalone\'
    - enforce_toplevel: True
    - source: 'C:\salt\tempdownload\Arsenal-Image-Mounter-v{{ version }}.zip'
    - source_hash: sha256={{ hash }}
    - overwrite: True
    - require:
      - sls: winfor.standalones.megatools
      - cmd: arsenal-download

arsenal-folder-rename:
  file.rename:
    - name: 'C:\standalone\arsenal'
    - source: 'C:\standalone\Arsenal-Image-Mounter-v{{ version }}\'
    - force: True
    - makedirs: True
    - require:
      - archive: arsenal-extract

winfor-standalones-arsenal-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\Arsenal Image Mounter.lnk'
    - target: 'C:\standalone\arsenal\ArsenalImageMounter.exe'
    - force: True
    - working_dir: 'C:\standalone\arsenal\'
    - makedirs: True
    - require:
      - sls: winfor.standalones.megatools
      - cmd: arsenal-download
      - archive: arsenal-extract
      - file: arsenal-folder-rename

