# Name: CAINE (Computer Aided INvestigative Environment)
# Website: https://www.caine-live.net/
# Description: USB bootable forensic environment
# Category: Utilities
# Author: Nanni Bassetti (https://www.caine-live.net/page4/page4.html)
# License: GNU General Public License v2.1+ (https://www.caine-live.net/)
# Version: 14.0
# Notes: 

{% set version = '14.0' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}

caine-iso-offline:
  file.managed:
    - name: '{{ inpath }}\caine\caine-{{ version }}.iso'
    - source: '{{ downloads }}\caine\caine-{{ version }}.iso'
    - skip_verify: True
    - makedirs: True

