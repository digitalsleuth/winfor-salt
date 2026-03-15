# Name: CAINE (Computer Aided INvestigative Environment)
# Website: https://www.caine-live.net/
# Description: USB bootable forensic environment
# Category: Utilities
# Author: Nanni Bassetti (https://www.caine-live.net/page4/page4.html)
# License: GNU General Public License v2.1+ (https://www.caine-live.net/)
# Version: 14.0
# Notes: 

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set version = '14.0' %}
{% set hash = '2702226cf9ee131ee54e9649d6d90008f3fe851ba35939f43ae8cb614a00d564' %}

caine-iso-download:
  file.managed:
    - name: '{{ inpath }}\caine\caine-{{ version }}.iso'
    - source: https://download.parrot.sh/parrot/iso/caine/caine{{ version }}.iso
    - source_hash: sha256={{ hash }}
    - makedirs: True

