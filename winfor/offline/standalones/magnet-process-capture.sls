# Name: MagnetProcessCapture
# Website: https://magnetforensics.com
# Description: Tool to dump a running process
# Category: Executables
# Author: Magnet Forensics
# License: EULA
# Version: v13
# Notes:

{% set version = 'V13' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

include:
  - winfor.config.shims

magnet-process-capture-extract-offline:
  archive.extracted:
    - name: {{ inpath }}\magnet\ProcessCapture\
    - source: '{{ downloads }}\magnetforensics\MagnetProcessCapture{{ version }}.zip'
    - enforce_toplevel: False

magnet-process-capture-shortcut-offline:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\Magnet Process Capture.lnk'
    - target: {{ inpath }}\magnet\ProcessCapture\MagnetProcessCapture.exe
    - force: True
    - working_dir: {{ inpath }}\magnet\ProcessCapture\
    - makedirs: True
    - require:
      - archive: magnet-process-capture-extract-offline
