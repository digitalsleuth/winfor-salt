# Name: USB Detective
# Website: https://usbdetective.com
# Description: Windows USB analysis tool
# Category: Windows Analysis
# Author: Jason Hale
# License: Software License Agreement (https://usbdetective.com/docs/usbdla.pdf)
# Version: 1.6.4
# Notes: 

{% set version = '1.6.4' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('usbdetective') %}

usbdetective-download-only:
  file.managed:
    - name: '{{ downloads }}\usbdetective\usbdetective-{{ version }}.zip'
    - source: "https://usbdetective.com/download/245/"
    - source_hash: sha256={{ hash }}
    - makedirs: True
