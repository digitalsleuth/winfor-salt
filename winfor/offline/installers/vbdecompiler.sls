# Name: VB-Decompiler
# Website: https://www.vb-decompiler.org
# Description: Visual Basic Decompiler
# Category: Executables
# Author: DotFix Software
# License: https://www.vb-decompiler.org/license.htm
# Version: 26.4
# Notes: 

{% set version = '26.4' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'vb-decompiler-'~ version ~'.zip' %}
{% set exists = salt['file.file_exists'](downloads + '\\vb-decompiler\\' + pkg) %}

{% if exists %}

vbdecompiler-extract-offline:
  archive.extracted:
    - name: '{{ downloads }}\vb-decompiler\'
    - source: '{{ downloads}}\vb-decompiler\{{ pkg }}'
    - enforce_toplevel: False

vbdecompiler-install-offline:
  cmd.run:
    - name: '{{ downloads }}\vb-decompiler\vb_decompiler_lite.exe /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /MERGETASKS=!DESKTOPICON,!RUNCODE'
    - shell: cmd
    - require:
      - archive: vbdecompiler-extract-offline

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
