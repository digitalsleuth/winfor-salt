# Name: Hayabusa
# Website: https://github.com/Yamato-Security/hayabusa
# Description: Windows event log fast forensics timeline generator and threat hunting tool 
# Category: Logs
# Author: Yamato Security
# License: GNU General Public License v3.0 (https://github.com/Yamato-Security/hayabusa/blob/main/LICENSE.txt)
# Version: 3.3.0
# Notes:

{% set version = '3.3.0' %}
{% set hash = '37bee154170429d272f3c5b228957d62c116d44cd52e6d3fb24e4b49785d6bbd' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set defender_status = salt['cmd.run']('powershell -c "(Get-Service windefend).Status"') %}

hayabusa-defender-exclusion:
  cmd.run:
{% if defender_status == "Running" %}
    - names:
      - 'echo "Defender is {{ defender_status }}"'
      - 'Add-MpPreference -ExclusionPath "{{ inpath }}"'
      - 'Add-MpPreference -ExclusionPath "C:\salt\tempdownload"'
      - 'Add-MpPreference -ExclusionPath "{{ PROGRAMDATA }}\Salt Project\Salt\var"'
{% else %}
    - name:
      - 'echo "Defender is {{ defender_status }}"'
{% endif %}
    - shell: powershell

hayabusa-download:
  file.managed:
    - name: 'C:\salt\tempdownload\hayabusa-{{ version }}-win-x64.zip'
    - source: https://github.com/Yamato-Security/hayabusa/releases/download/v{{ version }}/hayabusa-{{ version }}-win-x64.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

hayabusa-extract:
  archive.extracted:
    - name: '{{ inpath }}\hayabusa'
    - source: 'C:\salt\tempdownload\hayabusa-{{ version }}-win-x64.zip'
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

