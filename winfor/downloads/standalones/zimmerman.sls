# Name: Zimmerman Tools
# Website: https://ericzimmerman.github.io
# Description: Suite of Forensic Tools
# Category: Windows Analysis
# Author: Eric Zimmerman
# License: MIT License (https://github.com/EricZimmerman/Issues/blob/master/LICENSE)
# Version: 2026.5.0
# Notes: 

{% set version = '2026.5.0' %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('zimmerman', 'hash') %}
{% set hasher_hash = get_hash('zimmerman', 'hasher_hash') %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set today = salt['system.get_system_date']().replace("/","-") %}
{% set sync_tools = ['EvtxECmd','RECmd'] %}

include:
  - winfor.downloads.packages.dotnet9-desktop-runtime

zimmerman-tools-download-only:
  file.managed:
    - name: '{{ downloads }}\zimmerman\Get-ZimmermanTools-{{ version }}.zip'
    - source: https://download.ericzimmermanstools.com/Get-ZimmermanTools.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

zimmerman-tools-extract-download-only:
  archive.extracted:
    - name: '{{ downloads }}\zimmerman\'
    - source: '{{ downloads }}\zimmerman\Get-ZimmermanTools-{{ version }}.zip'
    - enforce_toplevel: False
    - watch:
      - file: zimmerman-tools-download-only

zimmerman-tools-install-download-only:
  cmd.run:
    - name: '.\Get-ZimmermanTools.ps1 -NetVersion 9 -Dest {{ downloads }}\zimmerman\zimmerman-{{ version }}'
    - cwd: '{{ downloads }}\zimmerman'
    - shell: powershell
    - watch:
      - archive: zimmerman-tools-extract-download-only

zimmerman-hasher-download-only:
  file.managed:
    - name: '{{ downloads }}\zimmerman\hasher-{{ version }}.zip'
    - source: https://download.ericzimmermanstools.com/hasher.zip
    - source_hash: sha256={{ hasher_hash }}
    - makedirs: True
