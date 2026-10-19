# Name: PuTTY
# Website: https://www.chiark.greenend.org.uk/~sgtatham/putty/
# Description: Free SSH and Telnet Client
# Category: Network
# Author: Simon Tatham
# License: https://tartarus.org/~simon/putty-snapshots/htmldoc/AppendixD.html#licence
# Version: 0.83
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '0.83' %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('putty') %}

putty-download-only:
  file.managed:
    - name: '{{ downloads }}\putty\putty-{{ version }}.msi'
    - source: https://the.earth.li/~sgtatham/putty/{{ version }}/w64/putty-64bit-{{ version }}-installer.msi
    - source_hash: sha256={{ hash }}
    - makedirs: True
