# Name: MS Word Parser
# Website: https://github.com/jjrboucher/MS-Word-Parser
# Description: MS Word document analysis tool
# Category: Documents / Editors
# Author: Jacques Boucher (jjrboucher) / Corey Forman (digitalsleuth)
# License: MIT License (https://github.com/jjrboucher/MS-Word-Parser/blob/master/LICENSE)
# Version: 3.0.1
# Notes:

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = "3.0.1" %}
{% set hash = "5a670eb2620a9730edd1382117d88e9027d8da102976e825d9547dafa010131e" %}

ms-word-parser-download-only:
  file.managed:
    - name: '{{ downloads }}\ms-word-parser\parse-docx-gui-v{{ version }}.exe'
    - source: https://github.com/jjrboucher/MS-Word-Parser/releases/download/v{{ version }}/parse-docx-v{{ version }}.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
