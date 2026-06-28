# Name: VB-Decompiler
# Website: https://www.vb-decompiler.org
# Description: Visual Basic Decompiler
# Category: Executables
# Author: DotFix Software
# License: https://www.vb-decompiler.org/license.htm
# Version: 26.3
# Notes: 

{% set version = '26.3' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}

vbdecompiler-extract-offline:
  archive.extracted:
    - name: '{{ downloads }}\vb-decompiler\'
    - source: '{{ downloads}}\vb-decompiler\vb_decompiler_lite-{{ version }}.zip'
    - enforce_toplevel: False

vbdecompiler-install-offline:
  cmd.run:
    - name: '{{ downloads }}\vb-decompiler\vb_decompiler_lite.exe /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /MERGETASKS=!DESKTOPICON,!RUNCODE'
    - shell: cmd
    - require:
      - archive: vbdecompiler-extract-offline
