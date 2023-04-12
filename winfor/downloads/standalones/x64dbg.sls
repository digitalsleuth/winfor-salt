# Name: x64dbg
# Website: https://sourceforge.net/projects/x64dbg/
# Description: Open Source x64/x32 debugger for Windows
# Category: Executables
# Author: Duncan Ogilvie (mrexodia)
# License: GNU General Public License v3 (https://github.com/x64dbg/x64dbg/blob/development/LICENSE)
# Version: 2023-04-07_18-12
# Notes: 

{% set version = '2023-04-07_18-12' %}
{% set hash = 'c3b5552d6343df7b892bb3eb88b7f3d8f699429c9ac3b3ee0e05167c47a4e283' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

x64dbg-download-only:
  file.managed:
    - name: '{{ downloads }}\snapshot_{{ version }}.zip'
    - source: https://github.com/x64dbg/x64dbg/releases/download/snapshot/snapshot_{{ version }}.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
