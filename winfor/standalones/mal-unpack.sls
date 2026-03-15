# Name: mal_unpack
# Website: https://github.com/hasherezade/mal_unpack
# Description: Dynamic unpacker based on PE-sieve
# Category: Executables
# Author: hasherezade
# License: BSD 2-Clause Simplified License (https://github.com/hasherezade/mal_unpack/blob/master/LICENSE)
# Version: 1.0
# Notes: 

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set version = '1.0' %}
{% set hash = '2ff766297c088e6a24b2ff9d92a11fc7585fe8c8444668161cd1e9875fb373a1' %}

include:
  - winfor.config.shims

mal-unpack-download:
  file.managed:
    - name: 'C:\salt\tempdownload\mal_unpack64.zip'
    - source: https://github.com/hasherezade/mal_unpack/releases/download/{{ version }}/mal_unpack64.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

mal-unpack-extract:
  archive.extracted:
    - name: '{{ inpath }}\mal-unpack'
    - source: 'C:\salt\tempdownload\mal_unpack64.zip'
    - enforce_toplevel: False
    - require:
      - file: mal-unpack-download

mal-unpack-shim:
  cmd.run:
    - name: 'powershell -nop -ep Bypass -File {{ inpath }}\New-Shim.ps1 -SourceExe {{ inpath }}\mal-unpack\mal_unpack.exe -OutPath {{ inpath }}\shims\mal-unpack.exe'
    - require:
      - sls: winfor.config.shims

