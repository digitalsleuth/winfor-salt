# Name: Py2ExeDecompiler
# Website: https://github.com/endgameinc/Py2ExeDecompiler
# Description: Decompiles executables originally compiled by Py2Exe
# Category: Installers
# Author: Amanda Rousseau
# License: MIT License (https://github.com/endgameinc/Py2ExeDecompiler/blob/master/LICENSE.txt)
# Version: 1.0
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

py2exedecompiler-download-only:
  file.managed:
    - name: '{{ downloads }}\Py2ExeDecompiler.exe'
    - source: https://github.com/endgameinc/Py2ExeDecompiler/raw/master/Py2ExeDecompiler/bin/Release/Py2ExeDecompiler.exe
    - source_hash: sha256=25b96c5c5f78c5df8da38aa61661c2f76796024af616bff67e1e6c683b8e5b3b
    - makedirs: True
