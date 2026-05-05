# Name: Magnet DumpIt
# Website: https://www.magnetforensics.com
# Description: Windows Memory Dump tools from Comae / Magnet
# Category: Acquisition and Analysis
# Author: Magnet Forensics
# License: EULA
# Version: 20250131
# Notes: 

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set version = '20250131' %}

magnet-dumpit-extract-offline:
  archive.extracted:
    - name: '{{ inpath }}\magnet\dumpit\'
    - source: '{{ downloads }}\magnetforensics\Comae-Toolkit-v{{ version }}.zip'
    - enforce_toplevel: False
