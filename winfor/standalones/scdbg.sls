# Name: scdbg
# Website: http://sandsprite.com/blogs/index.php?uid=7&pid=152
# Description: Shellcode analysis tool
# Category: Executables
# Author: https://github.com/dzzie/VS_LIBEMU/blob/master/AUTHORS
# License: 
# Version: 2022.11.1
# Notes: 

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set scdbg_hash = '47e0a2a1a3037907cbb834d1a2fe337c79a3f51107153402af33f1e9fd0608a6' %}
{% set gui_hash = '02654879bc42871e8a4022a71d1ec7735568cc8714068a7c1753a51909266de9' %}
{% set manual_hash = 'C9D605BA51DA3B8E2648E150E404D6B5DE2D4B60E1896141D02F591590CA64CF' %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

scdbg-download:
  file.managed:
    - name: '{{ inpath }}\scdbg\scdbg.exe'
    - source: https://github.com/dzzie/VS_LIBEMU/raw/master/scdbg.exe
    - source_hash: sha256={{ scdbg_hash }}
    - makedirs: True

scdbg-gui-download:
  file.managed:
    - name: '{{ inpath }}\scdbg\gui_launcher.exe'
    - source: https://github.com/dzzie/VS_LIBEMU/raw/master/gui_launcher.exe
    - source_hash: sha256={{ gui_hash }}
    - makedirs: True

scdbg-manual-download:
  file.managed:
    - name: '{{ inpath }}\scdbg\manual_en.chm'
    - source: https://github.com/dzzie/VS_LIBEMU/raw/master/manual_en.chm
    - source_hash: sha256={{ manual_hash }}
    - makedirs: True

scdbg-env-vars:
  win_path.exists:
    - name: '{{ inpath }}\scdbg\'

standalones-scdbg-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\SCDBG-GUI.lnk'
    - target: '{{ inpath }}\scdbg\gui_launcher.exe'
    - force: True
    - working_dir: '{{ inpath }}\scdbg\'
    - makedirs: True
    - require:
      - file: scdbg-download
      - archive: scdbg-extract
