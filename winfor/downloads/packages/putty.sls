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
{% set hash = 'aa8e5036d973688f1e8622fbe9ab22e037346e0def0197bf5e7cdf37da4e223d' %}

putty-download-only:
  file.managed:
    - name: '{{ downloads }}\putty\putty-64bit-{{ version }}-installer.msi'
    - source: https://the.earth.li/~sgtatham/putty/{{ version }}/w64/putty-64bit-{{ version }}-installer.msi
    - source_hash: sha256={{ hash }}
    - makedirs: True
