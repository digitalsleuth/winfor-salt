# Name: Py2ExeDecompiler
# Website: https://github.com/endgameinc/Py2ExeDecompiler
# Description: Decompiles executables originally compiled by Py2Exe
# Category: Installers
# Author: Amanda Rousseau
# License: MIT License (https://github.com/endgameinc/Py2ExeDecompiler/blob/master/LICENSE.txt)
# Version: 1.0
# Notes: 

{% set version = '1.0' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

py2exedecompiler-copy-offline:
  file.managed:
    - name: '{{ inpath }}\py2exe-decompiler\py2exe-decompiler.exe'
    - source: '{{ downloads }}\py2exe-decompiler\Py2ExeDecompiler-{{ version }}.exe'
    - skip_verify: True
    - makedirs: True

py2exedecompiler-shortcut-offline:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\Py2ExeDecompiler.lnk'
    - target: '{{ inpath }}\py2exe-decompiler\py2exe-decompiler.exe'
    - force: True
    - working_dir: '{{ inpath }}\py2exe-decompiler\'
    - makedirs: True
    - require:
      - file: py2exedecompiler-copy-offline
