# Name: Cutter
# Website: https://github.com/rizinorg/cutter
# Description: Reverse Engineering Platform powered by rizin
# Category: Executables
# Author: Rizin Organization
# License: GNU General Public License v3 (https://github.com/rizinorg/cutter/blob/dev/COPYING)
# Version: 2.4.1
# Notes: 

{% set version = '2.4.1' %}
{% set hash = '7156882b79870355f25fb273f36a313b71e0e76cd97e5a5765db4d163da39175' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

cutter-download-only:
  file.managed:
    - name: '{{ downloads }}\cutter\Cutter-v{{ version }}-Windows-x86_64.zip'
    - source: https://github.com/rizinorg/cutter/releases/download/v{{ version }}/Cutter-v{{ version }}-Windows-x86_64.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
