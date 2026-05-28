# Name: mal_unpack
# Website: https://github.com/hasherezade/mal_unpack
# Description: Dynamic unpacker based on PE-sieve
# Category: Executables
# Author: hasherezade
# License: BSD 2-Clause Simplified License (https://github.com/hasherezade/mal_unpack/blob/master/LICENSE)
# Version: 1.0
# Notes: 

{% set version = '1.0' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}

include:
  - winfor.config.shims

mal-unpack-extract-offline:
  archive.extracted:
    - name: '{{ inpath }}\mal-unpack'
    - source: '{{ downloads }}\malunpack\mal_unpack64-{{ version }}.zip'
    - enforce_toplevel: False

mal-unpack-shim-offline:
  cmd.run:
    - name: 'powershell -nop -ep Bypass -File {{ inpath }}\New-Shim.ps1 -SourceExe {{ inpath }}\mal-unpack\mal_unpack.exe -OutPath {{ inpath }}\shims\mal-unpack.exe'
    - require:
      - sls: winfor.config.shims
