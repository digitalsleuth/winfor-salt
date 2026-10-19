# Name: MagnetProcessCapture
# Website: https://magnetforensics.com
# Description: Tool to dump a running process
# Category: Executables
# Author: Magnet Forensics
# License: EULA
# Version: v13
# Notes:

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('magnet-process-capture') %}
{% set version = 'V13' %}

magnet-process-capture-download:
  file.managed:
    - name: 'C:\salt\tempdownload\MagnetProcessCapture{{ version }}.zip'
    - source: https://storage.googleapis.com/mfi-files/free_tools/MagnetProcessCapture/MagnetProcessCapture{{ version }}.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

magnet-process-capture-extract:
  archive.extracted:
    - name: {{ inpath }}\magnet\ProcessCapture\
    - source: 'C:\salt\tempdownload\MagnetProcessCapture{{ version }}.zip'
    - enforce_toplevel: False
    - require:
      - file: magnet-process-capture-download

standalones-magnet-process-capture-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\Magnet Process Capture.lnk'
    - target: {{ inpath }}\magnet\ProcessCapture\MagnetProcessCapture.exe
    - force: True
    - working_dir: {{ inpath }}\magnet\ProcessCapture\
    - makedirs: True
    - require:
      - archive: magnet-process-capture-extract
