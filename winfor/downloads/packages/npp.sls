# Name: Notepad++
# Website: https://notepad-plus-plus.org
# Description: Free source code / text editor
# Category: Documents / Editors
# Author: Don Ho
# License: GNU General Public License 2.0 (https://notepad-plus-plus.org/)
# Version: 8.7.1
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '8.7.1' %}
{% set hash = 'aa130d151859eccc8b4cc535ae756682069d626087e8c56a35b630df4b5f0024' %}

npp-download-only:
  file.managed:
    - name: '{{ downloads }}\npp\npp.{{ version }}.Installer.x64.exe'
    - source: https://github.com/notepad-plus-plus/notepad-plus-plus/releases/download/v{{ version }}/npp.{{ version }}.Installer.x64.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
