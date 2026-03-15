# Name: Rehex (Reverse Engineers' Hex Editor)
# Website: https://github.com/solemnwarning/rehex
# Description: Hex Editor with useful tools for Reverse Engineering
# Category: Executables
# Author: Daniel Collins
# License: GNU General Public License v2 (https://github.com/solemnwarning/rehex/blob/master/LICENSE.txt)
# Version: 0.63.4
# Notes:

{% set version = '0.63.4' %}
{% set hash = '68fd81bdea7fac87d77b2db6dd71bedcc77600d476db9a155012524b6d3db822' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

rehex-download-only:
  file.managed:
    - name: '{{ downloads }}\rehex\rehex_{{ version }}-win-x64.zip'
    - source: https://github.com/solemnwarning/rehex/releases/download/{{ version }}/rehex-{{ version }}-win-x64.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
