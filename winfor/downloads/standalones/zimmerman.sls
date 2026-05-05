# Name: Zimmerman Tools
# Website: https://ericzimmerman.github.io
# Description: Suite of Forensic Tools
# Category: Windows Analysis
# Author: Eric Zimmerman
# License: MIT License (https://github.com/EricZimmerman/Issues/blob/master/LICENSE)
# Version: 2026.5.0
# Notes: 

{% set version = '2026.5.0' %}
{% set hash = '12c7e9e3990959e374feb1919590428f7044feb1de9940c454c58ff41f488094' %}
{% set hasher_hash = 'a8a343013d6ed5b6988ebce1b3a561df51ab5928bc3a0f489a7e175f8f6f89d4' %}
{% set hasher_version = '2026.5.0' %}
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

zimmerman-tools-fix-index-url-download-only:
  file.replace:
    - name: '{{ downloads }}\zimmerman\Get-ZimmermanTools.ps1'
    - pattern: '"https://raw.githubusercontent.com/EricZimmerman/ericzimmerman.github.io/master/index.md"'
    - repl: '"https://raw.githubusercontent.com/EricZimmerman/ericzimmerman.github.io/refs/heads/master/docs/index.md"'
    - backup: False
    - require:
      - archive: zimmerman-tools-extract-download-only

zimmerman-tools-install-download-only:
  cmd.run:
    - name: '.\Get-ZimmermanTools.ps1 -NetVersion 9 -Dest {{ downloads }}\zimmerman\zimmerman-{{ version }}'
    - cwd: '{{ downloads }}\zimmerman'
    - shell: powershell
    - watch:
      - archive: zimmerman-tools-extract-download-only

{% for tool in sync_tools %}
zimmerman-tools-sync-{{ tool }}-download-only:
  cmd.run:
    - name: '{{ downloads }}\\zimmerman\\zimmerman-{{ version }}\\net9\\{{ tool }}\\{{ tool }}.exe --sync'
    - shell: cmd
    - require:
      - cmd: zimmerman-tools-install-download-only
{% endfor %}

zimmerman-hasher-download-only:
  file.managed:
    - name: '{{ downloads }}\zimmerman\hasher-{{ hasher_version }}.zip'
    - source: https://download.ericzimmermanstools.com/hasher.zip
    - source_hash: sha256={{ hasher_hash }}
    - makedirs: True
