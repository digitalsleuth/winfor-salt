# Name: USB Detective
# Website: https://usbdetective.com
# Description: Windows USB analysis tool
# Category: Windows Analysis
# Author: Jason Hale
# License: Software License Agreement (https://usbdetective.com/docs/usbdla.pdf)
# Version: 1.6.4
# Notes: 

{% set version = '1.6.4' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set pkg = 'usbdetective-'~ version ~'.zip' %}
{% set exists = salt['file.file_exists'](downloads + '\\usbdetective\\' + pkg) %}

{% if exists %}

usbdetective-extract-offline:
  archive.extracted:
    - name: '{{ inpath }}\usbdetective\'
    - source: '{{ downloads }}\usbdetective\{{ pkg }}'
    - enforce_toplevel: False

usbdetective-shortcut-offline:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\USB Detective.lnk'
    - target: '{{ inpath }}\usbdetective\USB Detective.exe'
    - force: True
    - working_dir: '{{ inpath }}\usbdetective\'
    - makedirs: True
    - require:
      - archive: usbdetective-extract-offline

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
