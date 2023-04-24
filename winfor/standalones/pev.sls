# Name: pev
# Website: https://github.com/mentebinaria/readpe
# Description: PE Analysis toolkit
# Category: Executables
# Author: Fernando Merces
# License: GNU General Public License v2.0 (https://github.com/mentebinaria/readpe/blob/master/LICENSE)
# Version: 0.81
# Notes:

{% set version = '0.81' %}
{% set hash = '2d0f8aad6701585d073c167c7c4358950b95a03f18a2b194a97f78f59825f5f3' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

pev-download:
  file.managed:
    - name: 'C:\salt\tempdownload\pev-{{ version }}-win.zip'
    - source: https://github.com/mentebinaria/readpe/releases/download/v{{ version }}/pev-{{ version }}-win.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

pev-extract:
  archive.extracted:
    - name: '{{ inpath }}\'
    - source: 'C:\salt\tempdownload\pev-{{ version }}-win.zip'
    - enforce_toplevel: True
    - require:
      - file: pev-download

pev-folder-rename:
  file.rename:
    - name: '{{ inpath }}\pev'
    - source: '{{ inpath }}\pev-{{ version }}-win\'
    - force: True
    - require:
      - archive: pev-extract

pev-env:
  win_path.exists:
    - name: '{{ inpath }}\pev\'

pev-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\PEV.lnk'
    - target: '{{ inpath }}\pev\run.bat'
    - icon_location: 'C:\Windows\SystemResources\imageres.dll.mun, 168'
    - force: True
    - working_dir: '{{ inpath }}\pev\'
    - makedirs: True
    - require:
      - archive: pev-extract
      - file: pev-folder-rename
