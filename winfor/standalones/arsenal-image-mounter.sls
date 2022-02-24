# Name: 
# Website: 
# Description: 
# Category: 
# Author: 
# License: 
# Notes:

{% set hash = '83a79a0dd3bbc58b5db36f9198d7f14635647517d825ab575c6103a6fb2a7e22' %}
{% set version = '3.6.188' %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

include:
  - winfor.standalones.megatools

arsenal-remove-previous:
  file.absent:
    - name: 'C:\salt\tempdownload\Arsenal-Image-Mounter-v{{ version }}.zip'

arsenal-download:
  cmd.run:
    - name: 'C:\standalone\megatools\megatools.exe dl https://mega.nz/file/v8xSEY4b#0EgcRRJ4rtkN1axSnho_Rulag-tToKmse_v8lUAloBE --path C:\salt\tempdownload'
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
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\Arsenal Image Mounter v{{ version }}.lnk'
    - target: 'C:\standalone\arsenal\ArsenalImageMounter.exe'
    - force: True
    - working_dir: 'C:\standalone\arsenal\'
    - makedirs: True
    - require:
      - sls: winfor.standalones.megatools
      - cmd: arsenal-download
      - archive: arsenal-extract
      - file: arsenal-folder-rename

