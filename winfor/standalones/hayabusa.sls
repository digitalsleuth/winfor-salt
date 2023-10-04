# Name: Hayabusa
# Website: https://github.com/Yamato-Security/hayabusa
# Description: Windows event log fast forensics timeline generator and threat hunting tool 
# Category: Logs
# Author: Yamato Security
# License: GNU General Public License v3.0 (https://github.com/Yamato-Security/hayabusa/blob/main/LICENSE.txt)
# Version: 2.9.0
# Notes:

{% set version = '2.9.0' %}
{% set hash = '870a6d07ea2a4ba82d19a98b4e656269ef88ebc7286ad8607bbeaaace4a84d44' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}

hayabusa-defender-exclusion:
  cmd.run:
    - names:
      - 'Add-MpPreference -ExclusionPath "{{ inpath }}\"'
      - 'Add-MpPreference -ExclusionPath "C:\salt\tempdownload\"'
    - shell: powershell

hayabusa-download:
  file.managed:
    - name: 'C:\salt\tempdownload\hayabusa-{{ version }}-win-64-bit.zip'
    - source: https://github.com/Yamato-Security/hayabusa/releases/download/v{{ version }}/hayabusa-{{ version }}-win-64-bit.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

hayabusa-extract:
  archive.extracted:
    - name: '{{ inpath }}\hayabusa'
    - source: 'C:\salt\tempdownload\hayabusa-{{ version }}-win-64-bit.zip'
    - enforce_toplevel: False
    - overwrite: True
    - require:
      - file: hayabusa-download
      - cmd: hayabusa-defender-exclusion

hayabusa-rename:
  file.rename:
    - name: '{{ inpath }}\hayabusa\hayabusa.exe'
    - source: '{{ inpath }}\hayabusa\hayabusa-{{ version }}-win-x64.exe'
    - force: True
    - require:
      - archive: hayabusa-extract

hayabusa-env:
  win_path.exists:
    - name: '{{ inpath }}\hayabusa\'
    
