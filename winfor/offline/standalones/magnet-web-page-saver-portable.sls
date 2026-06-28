# Name: WebPageSaver
# Website: https://magnetforensics.com
# Description: Creates an HTML report containing a snapshot of each webpage at a specific point in time
# Category: Network
# Author: Magnet Forensics
# License: EULA
# Version: 3.4.0
# Notes:

{% set version = 'V340' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

magnet-web-page-saver-extract-offline:
  archive.extracted:
    - name: '{{ inpath }}\magnet\'
    - source: '{{ downloads }}\magnetforensics\WebPageSaver{{ version }}-Portable.zip'
    - enforce_toplevel: False

magnet-web-page-saver-shortcut-offline:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\Magnet Web Page Saver Portable V3.lnk'
    - target: '{{ inpath }}\magnet\WebPageSaver\WebPageSaver.exe'
    - force: True
    - working_dir: '{{ inpath }}\magnet\WebPageSaver\'
    - makedirs: True
    - require:
      - archive: magnet-web-page-saver-extract-offline
