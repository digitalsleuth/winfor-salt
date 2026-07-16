# Name: MemProcFS-Analyzer
# Website: https://github.com/LETHAL-FORENSICS/MemProcFS-Analyzer
# Description: Powershell script utilizing MemProcFS for additional analysis
# Category: Raw Parsers / Decoders
# Author: Martin Willing / evild3ad
# License: GNU General Public License v3.0 (https://github.com/LETHAL-FORENSICS/MemProcFS-Analyzer/blob/main/LICENSE)
# Version: 1.2.1
# Notes: 

{% set version = '1.2.1' %}
{% set hash = '4a699827cefc5a162a24ae737583979ef540b521fa6e61c0890d7dbdcaf7d3c5' %}
{% set updater_hash = '7e03c8f3258eb444c12fee805004825066394eaa091e05ccc0b5cf7b32b9391f' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set defender_status = salt['cmd.powershell']('((Get-Service) -match "WinDefend").Name') %}

{% if defender_status.lower() == "windefend" %}

memprocfs-analyzer-defender-exclusion:
  cmd.run:
    - names:
      - 'echo "Defender is present on the system."'
      - 'Add-MpPreference -ExclusionPath "C:\salt\tempdownload"'
      - 'Add-MpPreference -ExclusionPath "{{ PROGRAMDATA }}\Salt Project\Salt\var"'
    - shell: powershell
{% else %}

"Defender is not present on the system - no exclusions required for memprocfs-analyzer.":
  test.nop

{% endif %}

include:
  - winfor.repos
  - winfor.packages.clamav
  - winfor.packages.dokany
  - winfor.packages.importexcel
  - winfor.packages.python3
  - winfor.packages.dotnet9-desktop-runtime

memprocfs-analyzer-download:
  file.managed:
    - name: 'C:\salt\tempdownload\MemProcFS-Analyzer-v{{ version }}.zip'
    - source: https://github.com/LETHAL-FORENSICS/MemProcFS-Analyzer/releases/download/v{{ version }}/MemProcFS-Analyzer-v{{ version }}.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

memprocfs-analyzer-extract:
  archive.extracted:
    - name: '{{ inpath }}\'
    - source: 'C:\salt\tempdownload\MemProcFS-Analyzer-v{{ version }}.zip'
    - enforce_toplevel: False
    - require:
      - file: memprocfs-analyzer-download

{% if salt['file.directory_exists'](inpath + "\\memprocfs-analyzer") %}
memprocfs-analyzer-delete-directory:
  file.absent:
    - name: '{{ inpath }}\memprocfs-analyzer\'
    - force: True
{% endif %}

memprocfs-analyzer-folder-rename:
  file.rename:
    - name: '{{ inpath }}\memprocfs-analyzer'
    - source: '{{ inpath }}\MemProcFS-Analyzer-main\'
    - force: True
    - makedirs: True
    - require:
      - archive: memprocfs-analyzer-extract
    - watch:
      - memprocfs-analyzer-extract

memprocfs-analyzer-modify-updater:
  file.managed:
    - name: '{{ inpath }}\memprocfs-analyzer\Updater.ps1'
    - source: https://raw.githubusercontent.com/LETHAL-FORENSICS/MemProcFS-Analyzer/7f9c61d9ca3ed0dcf5568972138a05b414a5a26c/Updater.ps1
    - source_hash: sha256={{ updater_hash }}
    - makedirs: True
    - force: True
    - require:
      - archive: memprocfs-analyzer-extract
      - file: memprocfs-analyzer-folder-rename

memprocfs-analyzer-updater:
  cmd.run:
    - name: 'powershell -nop -ep Bypass -File {{ inpath }}\memprocfs-analyzer\Updater.ps1'
    - cwd: '{{ inpath }}\memprocfs-analyzer'
    - require:
      - file: memprocfs-analyzer-modify-updater
    - watch:
      - file: memprocfs-analyzer-modify-updater

evtxecmd-sync:
  cmd.run:
    - name: '{{ inpath }}\memprocfs-analyzer\Tools\EvtxECmd\EvtxECmd.exe --sync'
    - shell: cmd
    - require:
      - cmd: memprocfs-analyzer-updater

recmd-sync:
  cmd.run:
    - name: '{{ inpath }}\memprocfs-analyzer\Tools\RECmd\RECmd.exe --sync'
    - shell: cmd
    - require:
      - cmd: memprocfs-analyzer-updater
