# Name: Zimmerman Tools
# Website: https://ericzimmerman.github.io
# Description: Suite of Forensic Tools
# Category: Windows Analysis
# Author: Eric Zimmerman
# License: MIT License (https://github.com/EricZimmerman/Issues/blob/master/LICENSE)
# Version: 2024-10-28
# Notes: 

{% set hash = '7ccb8de9821339bad495e03821e870c0c2bb6d5b99e71d90ff4730e1b63e28bd' %}
{% set hasher_hash = '14ee103793fae4f165adc5e0a9424ca75ea0a4dc2e823dcc2b7cdeb2ae94483c' %}
{% set hasher_version = '2.1.0.0' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '2024-08-20' %}
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
