# Name: usbdeviceforensics
# Website: https://github.com/digitalsleuth/usbdeviceforensics
# Description: Track a USB device throughout a Windows system
# Category: Windows Analysis
# Author: Corey Forman / Mark Woan
# License: Public Domain
# Version: 1.0.0
# Notes:

{% set version = "1.0.0" %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set hash = '67759eb39fcbfe99c98e1433ea05112633c9e6a43f252b6bd8679e95df190ab9' %}

include:
  - winfor.standalones.portable-python3

usbdeviceforensics-download-only:
  file.managed:
    - name: '{{ downloads }}\usbdeviceforensics-{{ version }}.zip'
    - source: https://github.com/digitalsleuth/usbdeviceforensics/archive/refs/heads/master.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

usbdeviceforensics-extract-download-only:
  archive.extracted:
    - name: '{{ downloads }}\'
    - source: '{{ downloads }}\usbdeviceforensics-{{ version }}.zip'
    - enforce_toplevel: False
    - require:
      - file: usbdeviceforensics-download-only

usbdeviceforensics-rename-download-only:
  file.rename:
    - name: '{{ downloads }}\usbdeviceforensics'
    - source: '{{ downloads }}\usbdeviceforensics-master\'
    - makedirs: True
    - force: True
    - require:
      - archive: usbdeviceforensics-extract-download-only

usbdeviceforensics-python-download-only:
  cmd.run:
    - name: '{{ inpath }}\portable-python3\python.exe -m pip download -d packages .'
    - cwd: '{{ downloads }}\usbdeviceforensics\'
    - require:
      - sls: winfor.standalones.portable-python3
      - archive: usbdeviceforensics-extract-download-only

usbdeviceforensics-remove-download-only:
  file.absent:
    - name: '{{ downloads }}\usbdeviceforensics-{{ version }}.zip'
    - require:
      - archive: usbdeviceforensics-extract-download-only

