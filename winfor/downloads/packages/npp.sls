# Name: Notepad++
# Website: https://notepad-plus-plus.org
# Description: Free source code / text editor
# Category: Documents / Editors
# Author: Don Ho
# License: GNU General Public License 2.0 (https://notepad-plus-plus.org/)
# Version: 8.6.5
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '8.6.5' %}
{% set hash = 'eedf45e0803ce36c4b745e54fc7a7136d9b364c2a795e646548a4350cf88a366' %}

npp-download-only:
  file.managed:
    - name: '{{ downloads }}\npp\npp.{{ version }}.Installer.x64.exe'
    - source: https://github.com/notepad-plus-plus/notepad-plus-plus/releases/download/v{{ version }}/npp.{{ version }}.Installer.x64.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
