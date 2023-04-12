# Name: Hayabusa
# Website: https://github.com/Yamato-Security/hayabusa
# Description: Windows event log fast forensics timeline generator and threat hunting tool 
# Category: Logs
# Author: Yamato Security
# License: GNU General Public License v3.0 (https://github.com/Yamato-Security/hayabusa/blob/main/LICENSE.txt)
# Version: 2.3.3
# Notes:

{% set version = '2.3.3' %}
{% set hash = 'bacf8596bf94715c85017f1a4236c5488de5573a0987742c20421f6e958e1ff0' %}
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
    
