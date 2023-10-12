# Name: Notepad++
# Website: https://notepad-plus-plus.org
# Description: Free source code / text editor
# Category: Documents / Editors
# Author: Don Ho
# License: GNU General Public License 2.0 (https://notepad-plus-plus.org/)
# Version: 8.5.7
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '8.5.7' %}
{% set hash = 'c629b9b1d16213142d845cd78f1b0aec29a74fbfe557a8451439d1a319040f62' %}

npp-download-only:
  file.managed:
    - name: '{{ downloads }}\npp\npp.{{ version }}.Installer.x64.exe'
    - source: https://github.com/notepad-plus-plus/notepad-plus-plus/releases/download/v{{ version }}/npp.{{ version }}.Installer.x64.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
