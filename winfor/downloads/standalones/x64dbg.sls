# Name: x64dbg
# Website: https://sourceforge.net/projects/x64dbg/
# Description: Open Source x64/x32 debugger for Windows
# Category: Executables
# Author: Duncan Ogilvie (mrexodia)
# License: GNU General Public License v3 (https://github.com/x64dbg/x64dbg/blob/development/LICENSE)
# Version: 2026.05.27
# Notes:

{% set version = '2026.05.27' %}
{% set date = '2026-05-27_12-11' %}
{% set hash = 'd41966dfc5b435a372798245300ca0ab7bb8e48bdbf48512c6fb20fcca427697' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

x64dbg-download-only:
  file.managed:
    - name: '{{ downloads }}\x64dbg\x64dbg-{{ version }}.zip'
    - source: https://github.com/x64dbg/x64dbg/releases/download/{{ version }}/snapshot_{{ date }}.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
