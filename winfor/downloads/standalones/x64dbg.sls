# Name: x64dbg
# Website: https://sourceforge.net/projects/x64dbg/
# Description: Open Source x64/x32 debugger for Windows
# Category: Executables
# Author: Duncan Ogilvie (mrexodia)
# License: GNU General Public License v3 (https://github.com/x64dbg/x64dbg/blob/development/LICENSE)
# Version: 2023-09-12_11-03
# Notes:

{% set version = '2023-09-12_11-03' %}
{% set hash = '6b270299fcfd03f2e5195c71396b08dddadb8441198340e3cf5075d29aaf1ad2' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

x64dbg-download-only:
  file.managed:
    - name: '{{ downloads }}\snapshot_{{ version }}.zip'
    - source: https://github.com/x64dbg/x64dbg/releases/download/snapshot/snapshot_{{ version }}.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
