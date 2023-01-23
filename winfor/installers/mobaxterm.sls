# Name: MobaXterm
# Website: https://mobaxterm.mobatek.net
# Description: Enhanced Terminal for Windows
# Category: Terminals
# Author: Mobatek (https://www.mobatek.net/aboutus.html)
# License: https://mobaxterm.mobatek.net/license.html
# Version: 22.2
# Notes: Home Edition

{% set version = '22.2' %}
{% set source_folder = '2222022102210348' %}
{% set hash = 'DFA7CC540973354366B70567E865DB477FCA2B46FF5950D3B9866E5033A952FC' %}

mobaxterm:
  file.managed:
    - name: 'C:\salt\tempdownload\MobaXterm_Installer_v{{ version }}.zip'
    - source: "https://download.mobatek.net/{{ source_folder }}/MobaXterm_Installer_v{{ version }}.zip"
    - source_hash: sha256={{ hash }}
    - makedirs: True

mobaxterm-archive:
  archive.extracted:
    - name: 'C:\salt\tempdownload\mobaxterm'
    - source: 'C:\salt\tempdownload\MobaXterm_Installer_v{{ version }}.zip'
    - enforce_toplevel: False
    - watch:
      - file: mobaxterm

mobaxterm-install:
  cmd.run:
    - name: "msiexec /i MobaXterm_installer_{{ version }}.msi DESKTOP_SHORTCUT=FALSE /qn /norestart"
    - cwd: 'C:\salt\tempdownload\mobaxterm'
    - shell: cmd

mobaxterm-del-shortcut:
  file.absent:
    - name: 'C:\Users\Public\Desktop\MobaXterm.lnk'
    - require:
      - cmd: mobaxterm-install
