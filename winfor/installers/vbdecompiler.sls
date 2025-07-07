# Name: VB-Decompiler
# Website: https://www.vb-decompiler.org
# Description: Visual Basic Decompiler
# Category: Executables
# Author: DotFix Software
# License: https://www.vb-decompiler.org/license.htm
# Version: 12.6
# Notes: 

{% set version = '12.6' %}
{% set hash = '6c42afc9d99c72652782ebf26539f404a258f812e434e35c152311fa4fabd0f1' %}

vbdecompiler-download:
  file.managed:
    - name: 'C:\salt\tempdownload\vb_decompiler_lite.zip'
    - source: https://www.vb-decompiler.org/files/vb_decompiler_lite.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

vbdecompiler-extract:
  archive.extracted:
    - name: 'C:\salt\tempdownload\'
    - source: 'C:\salt\tempdownload\vb_decompiler_lite.zip'
    - enforce_toplevel: False
    - require:
      - file: vbdecompiler-download

vbdecompiler-install:
  cmd.run:
    - name: 'C:\salt\tempdownload\vb_decompiler_lite.exe /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /MERGETASKS=!DESKTOPICON,!RUNCODE'
    - shell: cmd
