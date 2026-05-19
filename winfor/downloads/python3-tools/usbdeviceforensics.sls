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

include:
  - winfor.standalones.portable-python3

usbdeviceforensics-folder-download-only:
  file.directory:
    - name: '{{ downloads }}\usbdeviceforensics'
    - makedirs: True
    - force: True
    - win_inheritance: True

usbdeviceforensics-download-only:
  cmd.run:
    - name: '{{ inpath }}\portable-python3\python.exe -m pip download -d packages git+https://github.com/digitalsleuth/usbdeviceforensics.git'
    - cwd: '{{ downloads }}\usbdeviceforensics\'
    - require:
      - sls: winfor.standalones.portable-python3
      - file: usbdeviceforensics-folder-download-only
