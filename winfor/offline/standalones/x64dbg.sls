# Name: x64dbg
# Website: https://sourceforge.net/projects/x64dbg/
# Description: Open Source x64/x32 debugger for Windows
# Category: Executables
# Author: Duncan Ogilvie (mrexodia)
# License: GNU General Public License v3 (https://github.com/x64dbg/x64dbg/blob/development/LICENSE)
# Version: 2026-04-20_19-04
# Notes: 

{% set version = '2026-04-20_19-04' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set archs = ['64','32'] %}

x64dbg-extract-offline:
  archive.extracted:
    - name: '{{ inpath }}\x64dbg'
    - source: '{{ downloads }}\x64dbg\snapshot_{{ version }}.zip'
    - enforce_toplevel: False

{% for arch in archs %}
x64dbg-shortcut-{{ arch }}-offline:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\x64dbg.lnk'
    - target: '{{ inpath }}\x64dbg\release\x{{ arch }}\x{{ arch }}dbg.exe'
    - force: True
    - working_dir: '{{ inpath }}\x64dbg\release\x{{ arch }}\'
    - makedirs: True
    - require:
      - archive: x64dbg-extract-offline
{% endfor %}
