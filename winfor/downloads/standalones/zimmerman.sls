# Name: Zimmerman Tools
# Website: https://ericzimmerman.github.io
# Description: Suite of Forensic Tools
# Category: Windows Analysis
# Author: Eric Zimmerman
# License: MIT License (https://github.com/EricZimmerman/Issues/blob/master/LICENSE)
# Version: 2025-04-13
# Notes: 

{% set hash = 'e9993b590056016e75972ec34b25864fc7f88f574f15cf87f65b990177a1516c' %}
{% set hasher_hash = '1fa5f2e91eed2c819a107a160a56d6cc3e12807355741db6dde4395cb6d527bf' %}
{% set hasher_version = '2.1.0.0' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '2025-04-13' %}
{% set today = salt['system.get_system_date']().replace("/","-") %}

zimmerman-tools-download-only:
  file.managed:
    - name: '{{ downloads }}\zimmerman\Get-ZimmermanTools-{{ version }}.zip'
    - source: https://f001.backblazeb2.com/file/EricZimmermanTools/Get-ZimmermanTools.zip
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
    - name: 'powershell -nop -ep bypass -File Get-ZimmermanTools.ps1 -Dest {{ downloads }}\zimmerman\zimmerman-{{ today }}'
    - cwd: {{ downloads }}\zimmerman
    - shell: powershell
    - watch:
      - archive: zimmerman-tools-extract-download-only

zimmerman-hasher-download-only:
  file.managed:
    - name: '{{ downloads }}\zimmerman\hasher-{{ hasher_version }}.zip'
    - source: https://download.mikestammer.com/hasher.zip
    - source_hash: sha256={{ hasher_hash }}
    - makedirs: True
