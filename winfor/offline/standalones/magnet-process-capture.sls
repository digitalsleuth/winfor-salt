# Name: MagnetProcessCapture
# Website: https://magnetforensics.com
# Description: Tool to dump a running process
# Category: Executables
# Author: Magnet Forensics
# License: EULA
# Version: 13
# Notes:

{% set version = '13' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set pkg = 'magnet-process-capture-'~ version ~'.zip' %}
{% set exists = salt['file.file_exists'](downloads + '\\magnetforensics\\' + pkg) %}

{% if exists %}

magnet-process-capture-extract-offline:
  archive.extracted:
    - name: {{ inpath }}\magnet\ProcessCapture\
    - source: '{{ downloads }}\magnetforensics\{{ pkg }}'
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

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
