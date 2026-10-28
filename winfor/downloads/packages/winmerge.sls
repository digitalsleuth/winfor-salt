# Name: WinMerge
# Website: https://winmerge.org
# Description: File Differencing Tool
# Category: Utilities
# Author: Dean P. Grimm (Thingamahoocie Software)
# License: GNU General Public License v2.0 (https://github.com/WinMerge/winmerge/blob/master/LICENSE.md)
# Version: 2.16.60
# Notes:

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '2.16.60' %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('winmerge') %}

winmerge-download-only:
  file.managed:
    - name: '{{ downloads }}\winmerge\winmerge-{{ version }}.exe'
    - source: https://github.com/WinMerge/winmerge/releases/download/v{{ version }}/WinMerge-{{ version }}-x64-Setup.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
