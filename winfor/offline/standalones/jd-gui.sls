# Name: jd-gui
# Website: https://github.com/java-decompiler/jd-gui
# Description: GUI-based Java Decompiler
# Category: Mobile Analysis
# Author: Emmanuel Dupuy (emmanue1)
# License: GNU General Public License v3 (https://github.com/java-decompiler/jd-gui/blob/master/LICENSE)
# Version: 1.6.6
# Notes: 

{% set version = '1.6.6' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

include:
  - winfor.offline.packages.jdk17

jd-gui-extract-offline:
  archive.extracted:
    - name: '{{ inpath }}\'
    - source: '{{ downloads }}\jd-gui\jd-gui-windows-{{ version }}.zip'
    - enforce_toplevel: False
    - require:
      - sls: winfor.offline.packages.jdk17

jd-gui-rename-folder-offline:
  file.rename:
    - name: '{{ inpath }}\jd-gui'
    - source: '{{ inpath }}\jd-gui-windows-{{ version }}'
    - force: True
    - makedirs: True
    - require:
      - archive: jd-gui-extract-offline

jd-gui-shortcut-offline:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\JD-GUI.lnk'
    - target: '{{ inpath }}\jd-gui\jd-gui.exe'
    - force: True
    - working_dir: '{{ inpath }}\jd-gui\'
    - makedirs: True
    - require:
      - archive: jd-gui-extract-offline
      - file: jd-gui-rename-folder-offline
