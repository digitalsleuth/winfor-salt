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
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('caine') %}

caine-iso-download:
  file.managed:
    - name: '{{ inpath }}\caine\caine-{{ version }}.iso'
    - source: https://download.parrot.sh/parrot/iso/caine/caine{{ version }}.iso
    - source_hash: sha256={{ hash }}
    - makedirs: True

