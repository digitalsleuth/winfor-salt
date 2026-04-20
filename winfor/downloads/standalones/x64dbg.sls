# Name: x64dbg
# Website: https://sourceforge.net/projects/x64dbg/
# Description: Open Source x64/x32 debugger for Windows
# Category: Executables
# Author: Duncan Ogilvie (mrexodia)
# License: GNU General Public License v3 (https://github.com/x64dbg/x64dbg/blob/development/LICENSE)
# Version: 2026-04-20_19-04
# Notes:

{% set version = '2026-04-20_19-04' %}
{% set hash = '985561ea9fbd5e3cc557c9b5868ec608fcf450bfc88f0ac4a7279ded2a9ce7ec' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

x64dbg-download-only:
  file.managed:
    - name: '{{ downloads }}\x64dbg\snapshot_{{ version }}.zip'
    - source: https://github.com/x64dbg/x64dbg/releases/download/{{ version.split("_")[0] | replace("-",".") }}/snapshot_{{ version }}.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
