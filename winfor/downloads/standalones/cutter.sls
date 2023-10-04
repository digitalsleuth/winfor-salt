# Name: Cutter
# Website: https://github.com/rizinorg/cutter
# Description: Reverse Engineering Platform powered by rizin
# Category: Executables
# Author: Rizin Organization
# License: GNU General Public License v3 (https://github.com/rizinorg/cutter/blob/dev/COPYING)
# Version: 2.3.2
# Notes: 

{% set version = '2.3.2' %}
{% set hash = 'e53a137809a610f939ce13744640f0da67369e87fdb1b2545be3e417c7781c8e' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

cutter-download-only:
  file.managed:
    - name: '{{ downloads }}\Cutter-v{{ version }}-Windows-x86_64.zip'
    - source: https://github.com/rizinorg/cutter/releases/download/v{{ version }}/Cutter-v{{ version }}-Windows-x86_64.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
