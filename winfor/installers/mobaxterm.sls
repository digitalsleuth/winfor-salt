# Name: MobaXterm
# Website: https://mobaxterm.mobatek.net
# Description: Enhanced Terminal for Windows
# Category: Terminals
# Author: Mobatek (https://www.mobatek.net/aboutus.html)
# License: https://mobaxterm.mobatek.net/license.html
# Notes: Home Edition

{% set version = '22.0' %}
{% set source_folder = '2202022022680737' %}
{% set hash = 'B7EFC5AA99CF569BEEB61EBF6AE6912A4ECEDEC0320BCBF8256AED8571E3D134' %}

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
