# Name: MemProcFS-Analyzer
# Website: https://github.com/LETHAL-FORENSICS/MemProcFS-Analyzer
# Description: Powershell script utilizing MemProcFS for additional analysis
# Category: Raw Parsers / Decoders
# Author: Martin Willing / evild3ad
# License: GNU General Public License v3.0 (https://github.com/LETHAL-FORENSICS/MemProcFS-Analyzer/blob/main/LICENSE)
# Version: 1.2.1
# Notes: 

{% set version = '1.2.1' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}

include:
  - winfor.offline.packages.clamav
  - winfor.offline.packages.dokany
  - winfor.offline.packages.importexcel
  - winfor.offline.packages.dotnet9-desktop-runtime

memprocfs-analyzer-folder-copy-offline:
  file.rename:
    - name: '{{ inpath }}\memprocfs-analyzer'
    - source: '{{ downloads }}\memprocfs-analyzer\mpfsa'
    - force: True
    - makedirs: True
    - recurse: True
    - require:
      - sls: winfor.offline.packages.clamav
      - sls: winfor.offline.packages.dokany
      - sls: winfor.offline.packages.importexcel
      - sls: winfor.offline.packages.dotnet9-desktop-runtime
