# Name: x64dbg
# Website: https://sourceforge.net/projects/x64dbg/
# Description: Open Source x64/x32 debugger for Windows
# Category: Executables
# Author: Duncan Ogilvie (mrexodia)
# License: GNU General Public License v3 (https://github.com/x64dbg/x64dbg/blob/development/LICENSE)
# Version: 2023-10-05_13-38
# Notes:

{% set version = '2023-10-05_13-38' %}
{% set hash = 'c89dc82f0c4a822db111ef28cfd03428acb1aaafce6fba1a61fe8ddb5c2db7d2' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

x64dbg-download-only:
  file.managed:
    - name: '{{ downloads }}\x64dbg\snapshot_{{ version }}.zip'
    - source: https://github.com/x64dbg/x64dbg/releases/download/snapshot/snapshot_{{ version }}.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
