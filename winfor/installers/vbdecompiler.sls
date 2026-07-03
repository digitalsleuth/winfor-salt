# Name: VB-Decompiler
# Website: https://www.vb-decompiler.org
# Description: Visual Basic Decompiler
# Category: Executables
# Author: DotFix Software
# License: https://www.vb-decompiler.org/license.htm
# Version: 26.4
# Notes: 

{% set version = '26.4' %}
{% set hash = '2f3103ccc2c2b481e19b9b7ff69ad198df63bf06b6ea37635485c9d51c88b71d' %}

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
