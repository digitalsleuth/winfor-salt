# Name: jd-gui
# Website: https://github.com/java-decompiler/jd-gui
# Description: GUI-based Java Decompiler
# Category: Mobile Analysis
# Author: Emmanuel Dupuy (emmanue1)
# License: GNU General Public License v3 (https://github.com/java-decompiler/jd-gui/blob/master/LICENSE)
# Version: 1.6.6
# Notes: 

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set version = '1.6.6' %}
{% set hash = '79c231399d3d39d14fce7607728336acb47a6e02e9e1c5f2fa16e2450c0c46cb' %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

include:
  - winfor.packages.jdk17

jd-gui-download:
  file.managed:
    - name: 'C:\salt\tempdownload\jd-gui-windows-{{ version }}.zip'
    - source: https://github.com/java-decompiler/jd-gui/releases/download/v{{ version }}/jd-gui-windows-{{ version }}.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
    - require:
      - sls: winfor.packages.jdk17

jd-gui-extract:
  archive.extracted:
    - name: '{{ inpath }}\'
    - source: 'C:\salt\tempdownload\jd-gui-windows-{{ version }}.zip'
    - enforce_toplevel: False
    - require:
      - file: jd-gui-download

jd-gui-rename-folder:
  file.rename:
    - name: '{{ inpath }}\jd-gui'
    - source: '{{ inpath }}\jd-gui-windows-{{ version }}'
    - force: True
    - makedirs: True
    - require:
      - archive: jd-gui-extract

standalones-jd-gui-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\JD-GUI.lnk'
    - target: '{{ inpath }}\jd-gui\jd-gui.exe'
    - force: True
    - working_dir: '{{ inpath }}\jd-gui\'
    - makedirs: True
    - require:
      - file: jd-gui-download
      - archive: jd-gui-extract
      - file: jd-gui-rename-folder
