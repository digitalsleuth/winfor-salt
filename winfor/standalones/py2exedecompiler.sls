# Name: Py2ExeDecompiler
# Website: https://github.com/endgameinc/Py2ExeDecompiler
# Description: Decompiles executables originally compiled by Py2Exe
# Category: Installers
# Author: Amanda Rousseau
# License: MIT License (https://github.com/endgameinc/Py2ExeDecompiler/blob/master/LICENSE.txt)
# Version: 1.0
# Notes: 

{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

py2exedecompiler-download:
  file.managed:
    - name: 'C:\standalone\py2exedecompiler\Py2ExeDecompiler.exe'
    - source: https://github.com/endgameinc/Py2ExeDecompiler/raw/master/Py2ExeDecompiler/bin/Release/Py2ExeDecompiler.exe
    - source_hash: sha256=25b96c5c5f78c5df8da38aa61661c2f76796024af616bff67e1e6c683b8e5b3b
    - makedirs: True

winfor-standalones-py2exedecompiler-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\Py2ExeDecompiler.lnk'
    - target: 'C:\standalone\py2exedecompiler\Py2ExeDecompiler.exe'
    - force: True
    - working_dir: 'C:\standalone\py2exedecompiler\'
    - makedirs: True
    - require:
      - file: py2exedecompiler-download
