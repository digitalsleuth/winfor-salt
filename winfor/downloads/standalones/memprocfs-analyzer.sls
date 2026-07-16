# Name: MemProcFS-Analyzer
# Website: https://github.com/LETHAL-FORENSICS/MemProcFS-Analyzer
# Description: Powershell script utilizing MemProcFS for additional analysis
# Category: Windows Analysis
# Author: Martin Willing / evild3ad
# License: GNU General Public License v3.0 (https://github.com/LETHAL-FORENSICS/MemProcFS-Analyzer/blob/main/LICENSE)
# Version: 1.2.1
# Notes: 

{% set version = '1.2.1' %}
{% set hash = '4a699827cefc5a162a24ae737583979ef540b521fa6e61c0890d7dbdcaf7d3c5' %}
{% set updater_hash = '7e03c8f3258eb444c12fee805004825066394eaa091e05ccc0b5cf7b32b9391f' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set defender_status = salt['cmd.powershell']('((Get-Service) -match "WinDefend").Name') %}

{% if defender_status.lower() == "windefend" %}

memprocfs-analyzer-defender-exclusion-download-only:
  cmd.run:
    - names:
      - 'echo "Defender is present on the system."'
      - 'Add-MpPreference -ExclusionPath "{{ downloads }}"'
      - 'Add-MpPreference -ExclusionPath "{{ PROGRAMDATA }}\Salt Project\Salt\var"'
    - shell: powershell
{% else %}

"Defender is not present on the system - no exclusions required to download memprocfs-analyzer.":
  test.nop

{% endif %}
include:
  - winfor.downloads.packages.clamav
  - winfor.downloads.packages.dokany
  - winfor.downloads.packages.importexcel
  - winfor.downloads.packages.dotnet9-desktop-runtime
  - winfor.packages.nuget

memprocfs-analyzer-download-only:
  file.managed:
    - name: '{{ downloads }}\memprocfs-analyzer\memprocfs-analyzer-{{ version }}.zip'
    - source: https://github.com/LETHAL-FORENSICS/MemProcFS-Analyzer/releases/download/v{{ version }}/MemProcFS-Analyzer-v{{ version }}.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
    - require:
      - sls: winfor.packages.nuget
      - sls: winfor.downloads.packages.clamav
      - sls: winfor.downloads.packages.dokany
      - sls: winfor.downloads.packages.importexcel
      - sls: winfor.downloads.packages.dotnet9-desktop-runtime

memprocfs-analyzer-extract-download-only:
  archive.extracted:
    - name: '{{ downloads }}\memprocfs-analyzer\'
    - source: '{{ downloads }}\memprocfs-analyzer\memprocfs-analyzer-{{ version }}.zip'
    - enforce_toplevel: False
    - require:
      - file: memprocfs-analyzer-download-only

memprocfs-analyzer-folder-rename-download-only:
  file.rename:
    - name: '{{ downloads }}\memprocfs-analyzer\mpfsa'
    - source: '{{ downloads }}\memprocfs-analyzer\MemProcFS-Analyzer-main\'
    - force: True
    - makedirs: True
    - require:
      - archive: memprocfs-analyzer-extract-download-only

memprocfs-analyzer-modify-updater-download-only:
  file.managed:
    - name: '{{ downloads }}\memprocfs-analyzer\mpfsa\Updater.ps1'
    - source: https://raw.githubusercontent.com/LETHAL-FORENSICS/MemProcFS-Analyzer/7f9c61d9ca3ed0dcf5568972138a05b414a5a26c/Updater.ps1
    - source_hash: sha256={{ updater_hash }}
    - makedirs: True
    - force: True
    - require:
      - archive: memprocfs-analyzer-extract-download-only
      - file: memprocfs-analyzer-folder-rename-download-only

memprocfs-analyzer-updater-download-only:
  cmd.run:
    - name: 'powershell -nop -ep Bypass -File {{ downloads }}\memprocfs-analyzer\mpfsa\Updater.ps1'
    - cwd: '{{ downloads }}\memprocfs-analyzer\mpfsa'
    - shell: powershell
    - output_encoding: 'utf-8'
    - require:
      - file: memprocfs-analyzer-modify-updater-download-only
    - watch:
      - file: memprocfs-analyzer-modify-updater-download-only
