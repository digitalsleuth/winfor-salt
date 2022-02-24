# Name: 
# Website: 
# Description: 
# Category: 
# Author: 
# License: 
# Notes:

{% set version = 'V340' %}
{% set hash = '84cbe3ca660d7031fe85aee0faf2ce5e2d173c36f85dffff2d309ed52b5b08ae' %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

magnet-web-page-saver-download:
  file.managed:
    - name: 'C:\salt\tempdownload\WebPageSaver{{ version }}-Portable.zip'
    - source: https://storage.googleapis.com/mfi-files/free_tools/WPS/portable/WebPageSaver{{ version }}-Portable.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

magnet-web-page-saver-extract:
  archive.extracted:
    - name: 'C:\standalone\magnet\'
    - source: 'C:\salt\tempdownload\WebPageSaver{{ version }}-Portable.zip'
    - enforce_toplevel: False
    - require:
      - file: magnet-web-page-saver-download

winfor-standalones-wps-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\Magnet Web Page Saver Portable V3.lnk'
    - target: 'C:\standalone\magnet\WebPageSaver\WebPageSaver.exe'
    - force: True
    - working_dir: 'C:\standalone\magnet\WebPageSaver\'
    - makedirs: True
    - require:
      - file: magnet-web-page-saver-download
      - archive: magnet-web-page-saver-extract

magnet-web-page-saver-env-vars:
  win_path.exists:
    - name: 'C:\standalone\magnet\WebPageSaver\'
