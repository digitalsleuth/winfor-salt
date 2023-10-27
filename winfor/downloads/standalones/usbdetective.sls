# Name: USB Detective
# Website: https://usbdetective.com
# Description: Windows USB analysis tool
# Category: Windows Analysis
# Author: Jason Hale
# License: Software License Agreement (https://usbdetective.com/docs/usbdla.pdf)
# Version: 1.6.4
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set hash = 'c1a2a8e5936e187ecee8ad85b0efa42290598c987bacc1fbd8c587d5a6fbe799' %}
{% set version = '1.6.3' %}

usbdetective-download-only:
  file.managed:
    - name: '{{ downloads }}\usbdetective\USBDetective-{{ version }}.zip'
    - source: "https://usbdetective.com/download/245/"
    - source_hash: sha256={{ hash }}
    - makedirs: True
