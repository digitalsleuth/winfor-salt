# Name: PuTTY
# Website: https://www.chiark.greenend.org.uk/~sgtatham/putty/
# Description: Free SSH and Telnet Client
# Category: Network
# Author: Simon Tatham
# License: https://tartarus.org/~simon/putty-snapshots/htmldoc/AppendixD.html#licence
# Version: 0.79
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '0.79' %}
{% set hash = 'beec23b8ead065f868e9cda021265998697e797064234a87c888be96e2c70060' %}

putty-download-only:
  file.managed:
    - name: '{{ downloads }}\putty\putty-64bit-{{ version }}-installer.msi'
    - source: https://the.earth.li/~sgtatham/putty/{{ version }}/w64/putty-64bit-{{ version }}-installer.msi
    - source_hash: sha256={{ hash }}
    - makedirs: True
