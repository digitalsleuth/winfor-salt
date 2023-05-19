# Name: Zimmerman Tools
# Website: https://ericzimmerman.github.io
# Description: Suite of Forensic Tools
# Category: Windows Analysis
# Author: Eric Zimmerman
# License: MIT License (https://github.com/EricZimmerman/Issues/blob/master/LICENSE)
# Version: 2023-05-18
# Notes: 

{% set hash = '0814e5f07236313e0454413060c0dd7f6c0a0b07e6f491169e521268b485816f' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

zimmerman-tools-download-only:
  file.managed:
    - name: '{{ downloads }}\Get-ZimmermanTools.zip'
    - source: https://f001.backblazeb2.com/file/EricZimmermanTools/Get-ZimmermanTools.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

zimmerman-tools-extract-download-only:
  archive.extracted:
    - name: '{{ downloads }}\zimmerman\'
    - source: '{{ downloads }}\Get-ZimmermanTools.zip'
    - enforce_toplevel: False
    - watch:
      - file: zimmerman-tools-download-only

zimmerman-tools-install-download-only:
  cmd.run:
    - name: 'powershell -nop -ep bypass -File Get-ZimmermanTools.ps1 -Dest {{ downloads }}\zimmerman'
    - cwd: {{ downloads }}\zimmerman
    - shell: powershell
    - watch:
      - archive: zimmerman-tools-extract-download-only
