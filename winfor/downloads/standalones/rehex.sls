# Name: Rehex (Reverse Engineers' Hex Editor)
# Website: https://github.com/solemnwarning/rehex
# Description: Hex Editor with useful tools for Reverse Engineering
# Category: Executables
# Author: Daniel Collins
# License: GNU General Public License v2 (https://github.com/solemnwarning/rehex/blob/master/LICENSE.txt)
# Version: 0.60.1
# Notes:

{% set version = '0.60.1' %}
{% set hash = '70c14eb25050ad592d7c4c079cd5cd376e49b99890cb36ba9b273cc760c38cf7' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

rehex-download-only:
  file.managed:
    - name: '{{ downloads }}\rehex_{{ version }}-win-x86_64.zip'
    - source: https://github.com/solemnwarning/rehex/releases/download/{{ version }}/rehex-{{ version }}-win-x86_64.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
