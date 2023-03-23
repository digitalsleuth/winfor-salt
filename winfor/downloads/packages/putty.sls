# Name: PuTTY
# Website: https://www.chiark.greenend.org.uk/~sgtatham/putty/
# Description: Free SSH and Telnet Client
# Category: Network
# Author: Simon Tatham
# License: https://tartarus.org/~simon/putty-snapshots/htmldoc/AppendixD.html#licence
# Version: 0.78
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '0.78' %}
{% set hash = 'e64775374097f1b1c8fd4173f7d5be4305b88cec26a56d003113aff2837ae08e' %}

putty-download-only:
  file.managed:
    - name: '{{ downloads }}\putty-64bit-{{ version }}-installer.msi'
    - source: https://the.earth.li/~sgtatham/putty/{{ version }}/w64/putty-64bit-{{ version }}-installer.msi
    - source_hash: sha256={{ hash }}
    - makedirs: True
