# Name: WinMerge
# Website: https://winmerge.org
# Description: File Differencing Tool
# Category: Utilities
# Author: Dean P. Grimm (Thingamahoocie Software)
# License: GNU General Public License v2.0 (https://github.com/WinMerge/winmerge/blob/master/LICENSE.md)
# Version: 2.16.32
# Notes:

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '2.16.32' %}
{% set hash = '8d6a6c7c4b6c6c844d993697fa8f0818a8b6213c0e2d64fd97d74478138d53fd' %}

winmerge-download-only:
  file.managed:
    - name: '{{ downloads }}\winmerge\WinMerge-{{ version }}-x64-Setup.exe'
    - source: https://github.com/WinMerge/winmerge/releases/download/v{{ version }}/WinMerge-{{ version }}-x64-Setup.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
