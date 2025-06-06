# Name: Rehex (Reverse Engineers' Hex Editor)
# Website: https://github.com/solemnwarning/rehex
# Description: Hex Editor with useful tools for Reverse Engineering
# Category: Executables
# Author: Daniel Collins
# License: GNU General Public License v2 (https://github.com/solemnwarning/rehex/blob/master/LICENSE.txt)
# Version: 0.62.0
# Notes:

{% set version = '0.62.0' %}
{% set hash = 'bfe76cdf4bdfe94180ab25882901bd6479488c0865aa38d318e7f4d6cf2cb58e' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

rehex-download-only:
  file.managed:
    - name: '{{ downloads }}\rehex\rehex_{{ version }}-win-x64.zip'
    - source: https://github.com/solemnwarning/rehex/releases/download/{{ version }}/rehex-{{ version }}-win-x64.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
