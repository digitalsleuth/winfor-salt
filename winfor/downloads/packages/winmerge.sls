# Name: WinMerge
# Website: https://winmerge.org
# Description: File Differencing Tool
# Category: Utilities
# Author: Dean P. Grimm (Thingamahoocie Software)
# License: GNU General Public License v2.0 (https://github.com/WinMerge/winmerge/blob/master/LICENSE.md)
# Version: 2.16.25
# Notes:

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '2.16.25' %}
{% set hash = '47d9d72bfaf3932e88fe9696f4773ab97831ac290677f64fd8e1efd25c02f492' %}

winmerge-download-only:
  file.managed:
    - name: '{{ downloads }}\WinMerge-{{ version }}-x64-Setup.exe'
    - source: https://github.com/WinMerge/winmerge/releases/download/v{{ version }}/WinMerge-{{ version }}-x64-Setup.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
