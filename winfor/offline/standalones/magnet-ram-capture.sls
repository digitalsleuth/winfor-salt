# Name: Magnet RAM Capture (MRC)
# Website: https://magnetforensics.com
# Description: Windows memory capture utility
# Category: Acquisition and Analysis
# Author: Magnet Forensics
# License: EULA
# Version: 1.2.0
# Notes: Shim and shortcuts not configured as this is intended for deployment on a separate machine

{% set version = 'v120' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}

magnet-ram-capture-offline:
  file.managed:
    - name: '{{ inpath }}\magnet\RAMCapture\MRC.exe'
    - source: '{{ downloads }}\magnetforensics\MRC{{ version }}.exe'
    - skip_verify: True
    - makedirs: True
