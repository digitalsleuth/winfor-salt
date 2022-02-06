# Name: 
# Website: 
# Description: 
# Category: 
# Author: 
# License: 
# Notes: 

{% set version = '1.6.6' %}
{% set hash = '79c231399d3d39d14fce7607728336acb47a6e02e9e1c5f2fa16e2450c0c46cb' %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
include:
  - winfor.installers.jre8

jd-gui-download:
  file.managed:
    - name: 'C:\salt\tempdownload\jd-gui-windows-{{ version }}.zip'
    - source: https://github.com/java-decompiler/jd-gui/releases/download/v{{ version }}/jd-gui-windows-{{ version }}.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
    - require:
      - sls: winfor.installers.jre8

jd-gui-extract:
  archive.extracted:
    - name: 'C:\standalone\'
    - source: 'C:\salt\tempdownload\jd-gui-windows-{{ version }}.zip'
    - enforce_toplevel: False
    - require:
      - file: jd-gui-download

jd-gui-rename-folder:
  file.rename:
    - name: 'C:\standalone\jd-gui'
    - source: 'C:\standalone\jd-gui-windows-{{ version }}'
    - force: True
    - makedirs: True
    - require:
      - archive: jd-gui-extract

winfor-standalones-jd-gui-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\JD-GUI.lnk'
    - target: 'C:\standalone\jd-gui\jd-gui.exe'
    - force: True
    - working_dir: 'C:\standalone\jd-gui\'
    - makedirs: True
    - require:
      - file: jd-gui-download
      - archive: jd-gui-extract
      - file: jd-gui-rename-folder
