# Name: Hayabusa
# Website: https://github.com/WithSecureLabs/Chainsaw
# Description: Sigma-based threat hunting and fast forensics timeline generator for Windows event logs
# Category: Windows Analysis
# Author: YamatoSecurity
# License: GNU General Public License v3.0 (https://github.com/Yamato-Security/hayabusa/blob/main/LICENSE.txt)
# Version: 2.3.2
# Notes:

{% set version = '2.3.2' %}
{% set hash = '2B2DEF58FBFDA68BE9C4C72131F318C71D424B0846FEB2EDA84686D825846E97' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}

hayabusa-download:
  file.managed:
    - name: 'C:\salt\tempdownload\hayabusa-2.3.2-win-all.zip'
    - source: https://github.com/Yamato-Security/hayabusa/releases/download/v{{ version }}/hayabusa-2.3.2-win-all.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

hayabusa-extract:
  archive.extracted:
    - name: '{{ inpath }}\'
    - source: 'C:\salt\tempdownload\hayabusa-2.3.2-win-all.zip'
    - enforce_toplevel: False
    - overwrite: True
    - require:
      - file: hayabusa-download

hayabusa-rename:
  file.rename:
    - name: '{{ inpath }}\hayabysa\hayabusa.exe'
    - source: '{{ inpath }}\hayabusa\hayabusa-{{ version }}-win-x64.exe'
    - force: True
    - require:
      - archive: chainsaw-extract

hayabusa-env:
  win_path.exists:
    - name: '{{ inpath }}\hayabusa\'
