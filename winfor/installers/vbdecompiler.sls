# Name: VB-Decompiler
# Website: https://www.vb-decompiler.org
# Description: Visual Basic Decompiler
# Category: Executables
# Author: DotFix Software
# License: https://www.vb-decompiler.org/license.htm
# Version: 12.0
# Notes: 

{% set version = '12.0' %}
{% set hash = '5560da8cd006120869d1bfc2bb8d26636e512fbd285c9aba96fd8e3d7ff273b3' %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

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
