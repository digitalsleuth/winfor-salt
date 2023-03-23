# Name: Cutter
# Website: https://github.com/rizinorg/cutter
# Description: Reverse Engineering Platform powered by rizin
# Category: Executables
# Author: Rizin Organization
# License: GNU General Public License v3 (https://github.com/rizinorg/cutter/blob/dev/COPYING)
# Version: 2.1.2
# Notes: 

{% set version = '2.1.2' %}
{% set hash = '9bd08fc9d5591149d3e6fee3e269458e3781706c09c2c1ff49355e48d27c0486' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

cutter-download-only:
  file.managed:
    - name: '{{ downloads }}\Cutter-v{{ version }}-Windows-x86_64.zip'
    - source: https://github.com/rizinorg/cutter/releases/download/v{{ version }}/Cutter-v{{ version }}-Windows-x86_64.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
