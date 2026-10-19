# Name: Py2ExeDecompiler
# Website: https://github.com/endgameinc/Py2ExeDecompiler
# Description: Decompiles executables originally compiled by Py2Exe
# Category: Installers
# Author: Amanda Rousseau
# License: MIT License (https://github.com/endgameinc/Py2ExeDecompiler/blob/master/LICENSE.txt)
# Version: 1.0
# Notes: 

{% set version = '1.0' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('py2exedecompiler') %}

py2exedecompiler-download-only:
  file.managed:
    - name: '{{ downloads }}\py2exe-decompiler\py2exe-decompiler-{{ version }}.exe'
    - source: https://github.com/endgameinc/Py2ExeDecompiler/raw/master/Py2ExeDecompiler/bin/Release/Py2ExeDecompiler.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
