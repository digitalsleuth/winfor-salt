# Name: VB-Decompiler
# Website: https://www.vb-decompiler.org
# Description: Visual Basic Decompiler
# Category: Executables
# Author: DotFix Software
# License: https://www.vb-decompiler.org/license.htm
# Version: 12.5
# Notes: 

{% set version = '12.5' %}
{% set hash = '77e833921eac180428ba500d3deddf699814cc870c40d7ac2f700e71c1261be6' %}
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
