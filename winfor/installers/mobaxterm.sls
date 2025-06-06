# Name: MobaXterm
# Website: https://mobaxterm.mobatek.net
# Description: Enhanced Terminal for Windows
# Category: Terminals
# Author: Mobatek (https://www.mobatek.net/aboutus.html)
# License: https://mobaxterm.mobatek.net/license.html
# Version: 25.2
# Notes: Home Edition

{% set version = '25.2' %}
{% set source_folder = '2522025040602403' %}
{% set hash = 'cdcf61ffede716ad566fefcbeebda7f02eb6a51d299b8eff5d87988c8e839c3b' %}

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
    - require:
      - file: mobaxterm

mobaxterm-install:
  cmd.run:
    - name: "msiexec /i MobaXterm_installer_{{ version }}.msi DESKTOP_SHORTCUT=FALSE /qn /norestart"
    - cwd: 'C:\salt\tempdownload\mobaxterm'
    - shell: cmd
    - require:
      - archive: mobaxterm-archive

mobaxterm-del-shortcut:
  file.absent:
    - name: 'C:\Users\Public\Desktop\MobaXterm.lnk'
    - require:
      - cmd: mobaxterm-install
