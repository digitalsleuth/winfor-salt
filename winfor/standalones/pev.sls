# Name: pev
# Website: https://github.com/merces/pev
# Description: PE Analysis toolkit
# Category: Executables
# Author: Fernando Merces
# License: GNU General Public License v2.0 (https://github.com/merces/pev/blob/master/LICENSE)
# Version: 0.81
# Notes:

{% set version = '0.81' %}
{% set hash = '2D0F8AAD6701585D073C167C7C4358950B95A03F18A2B194A97F78F59825F5F3' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}

pev-download:
  file.managed:
    - name: 'C:\salt\tempdownload\pev-{{ version }}-win.zip'
    - source: https://github.com/merces/pev/releases/download/v{{ version }}/pev-{{ version }}-win.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

pev-extract:
  archive.extracted:
    - name: 'C:\standalones\pev\'
    - source: 'C:\salt\tempdownload\pev-{{ version }}-win.zip'
    - enforce_toplevel: True
    - require:
      - file: pev-download

pev-folder-rename:
  file.rename:
    - name: 'C:\standalones\pev'
    - source: 'C:\standalones\pev-{{ version }}-win\'
    - force: True
    - require:
      - archive: pev-extract

pev-env:
  win_path.exists:
    - name: 'C:\standalones\pev\'
