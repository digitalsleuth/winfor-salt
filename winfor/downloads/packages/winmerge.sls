# Name: WinMerge
# Website: https://winmerge.org
# Description: File Differencing Tool
# Category: Utilities
# Author: Dean P. Grimm (Thingamahoocie Software)
# License: GNU General Public License v2.0 (https://github.com/WinMerge/winmerge/blob/master/LICENSE.md)
# Version: 2.16.48.2
# Notes:

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '2.16.48.2' %}
{% set hash = 'f8adc543b2dc722252b87b92bae982cce9083a642df30329419457a90484dfa3' %}

winmerge-download-only:
  file.managed:
    - name: '{{ downloads }}\winmerge\WinMerge-{{ version }}-x64-Setup.exe'
    - source: https://github.com/WinMerge/winmerge/releases/download/v{{ version }}/WinMerge-{{ version }}-x64-Setup.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
