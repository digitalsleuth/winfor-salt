# Name: usbdeviceforensics
# Website: https://github.com/digitalsleuth/usbdeviceforensics
# Description: Track a USB device throughout a Windows system
# Category: Windows Analysis
# Author: Corey Forman / Mark Woan
# License: Public Domain
# Version: 1.0.0
# Notes: 

{% set version = '1.0.0' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'usbdeviceforensics.py' %}
{% set exists = salt['file.file_exists'](downloads + '\\usbdeviceforensics\\usbdeviceforensics\\' + pkg) %}

{% if exists %}

include:
  - winfor.offline.packages.python3

usbdeviceforensics-install-offline:
  cmd.run:
    - name: '"C:\Program Files\Python310\python.exe" -m pip install --no-index --find-links=.\packages usbdeviceforensics'
    - cwd: '{{ downloads }}\usbdeviceforensics\'
    - require:
      - sls: winfor.offline.packages.python3

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
