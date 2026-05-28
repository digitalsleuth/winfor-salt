# Name: Caffeine
# Website: https://www.zhornsoftware.co.uk
# Description: Mouse Jiggling Software
# Category: Utilities
# Author: Tom Revell
# License: Free
# Version: 1.98
# Notes: 32-bit and 64-bit executables, execute from command line for additional parameters

{% set version = '1.98' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}

caffeine-archive-extract-offline:
  archive.extracted:
    - name: '{{ inpath }}\caffeine\'
    - source: '{{ downloads }}\caffeine\caffeine-{{ version }}.zip'
    - overwrite: True
    - enforce_toplevel: False
