# Name: MS Word Parser
# Website: https://github.com/jjrboucher/MS-Word-Parser
# Description: MS Word document analysis tool
# Category: Documents / Editors
# Author: Jacques Boucher (jjrboucher) / Corey Forman (digitalsleuth)
# License: MIT License (https://github.com/jjrboucher/MS-Word-Parser/blob/master/LICENSE)
# Version: 3.0.1
# Notes: 

{% set inpath = salt["pillar.get"]("inpath", "C:\standalone") %}
{% set version = "3.0.1" %}
{% set hash = "5a670eb2620a9730edd1382117d88e9027d8da102976e825d9547dafa010131e" %}
{% set PROGRAMDATA = salt["environ.get"]("PROGRAMDATA") %}

ms-word-parser-download:
  file.managed:
    - name: '{{ inpath }}\ms-word-parser\parse-docx-gui.exe'
    - source: https://github.com/jjrboucher/MS-Word-Parser/releases/download/v{{ version }}/parse-docx-v{{ version }}.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True

ms-word-parser-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\MS Word Parser.lnk'
    - target: '{{ inpath }}\ms-word-parser\parse-docx-gui.exe'
    - force: True
    - working_dir: '{{ inpath }}\ms-word-parser\'
    - makedirs: True
    - require:
      - file: ms-word-parser-download
