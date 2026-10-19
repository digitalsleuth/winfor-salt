# Name: WebPageSaver
# Website: https://magnetforensics.com
# Description: Creates an HTML report containing a snapshot of each webpage at a specific point in time
# Category: Network
# Author: Magnet Forensics
# License: EULA
# Version: 3.4.0
# Notes:

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set version = 'V340' %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('magnet-web-page-saver-portable') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

magnet-web-page-saver-download:
  file.managed:
    - name: 'C:\salt\tempdownload\WebPageSaver{{ version }}-Portable.zip'
    - source: https://storage.googleapis.com/mfi-files/free_tools/WPS/portable/WebPageSaver{{ version }}-Portable.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

magnet-web-page-saver-extract:
  archive.extracted:
    - name: '{{ inpath }}\magnet\'
    - source: 'C:\salt\tempdownload\WebPageSaver{{ version }}-Portable.zip'
    - enforce_toplevel: False
    - require:
      - file: magnet-web-page-saver-download

standalones-wps-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\Magnet Web Page Saver Portable V3.lnk'
    - target: '{{ inpath }}\magnet\WebPageSaver\WebPageSaver.exe'
    - force: True
    - working_dir: '{{ inpath }}\magnet\WebPageSaver\'
    - makedirs: True
    - require:
      - file: magnet-web-page-saver-download
      - archive: magnet-web-page-saver-extract

