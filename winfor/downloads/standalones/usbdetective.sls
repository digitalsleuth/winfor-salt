# Name: USB Detective
# Website: https://usbdetective.com
# Description: Windows USB analysis tool
# Category: Windows Analysis
# Author: Jason Hale
# License: Software License Agreement (https://usbdetective.com/docs/usbdla.pdf)
# Version: 1.6.3
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set hash = '71971E63E3420F69A2B6055F90EB7EB64C8496423FE073741D159ABAC04E08A5' %}

usbdetective-download-only:
  file.managed:
    - name: '{{ downloads }}\USBDetective.zip'
    - source: "https://usbdetective.com/download/245/"
    - source_hash: sha256={{ hash }}
    - makedirs: True
