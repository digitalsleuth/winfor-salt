# Name: Zimmerman Tools
# Website: https://ericzimmerman.github.io
# Description: Suite of Forensic Tools
# Category: Windows Analysis
# Author: Eric Zimmerman
# License: MIT License (https://github.com/EricZimmerman/Issues/blob/master/LICENSE)
# Version: 2021-01-22
# Notes: 

{% set hash = '7864ce0ab57e3831bad24f56abc1c9c6796a552091d2f49262e66565e66c0447' %}
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
