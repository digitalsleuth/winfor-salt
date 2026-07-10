# Name: deark
# Website: https://entropymine.com/deark/
# Description: Portable command-line utility to decode file types
# Category: Raw Parsers / Decoders
# Author: Jason Summers
# License: MIT (https://github.com/jsummers/deark/blob/master/COPYING)
# Version: 1.7.3
# Notes: 

{% set version = '1.7.3' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set hash = '84f9e0134830389e4ab12c89dc09cf42a3f885ec551254e9fdc22952858add11' %}

include:
  - winfor.packages.7zip
  - winfor.config.shims

deark-download:
  file.managed:
    - name: 'C:\salt\tempdownload\deark-{{ version }}.tar.gz'
    - source: https://entropymine.com/deark/releases/deark-{{ version }}.tar.gz
    - source_hash: sha256={{ hash }}
    - makedirs: True
    - require:
      - pkg: 7zip

deark-extract:
  cmd.run:
    - name: '"C:\Program Files\7-Zip\7z.exe" x C:\salt\tempdownload\deark-{{ version }}.tar.gz -o"{{ inpath }}\" -y && "C:\Program Files\7-Zip\7z.exe" x {{ inpath }}\deark-{{ version }}.tar -o"{{ inpath }}\"'
    - shell: cmd

deark-delete-tar:
  file.absent:
    - name: '{{ inpath }}\deark-{{ version }}.tar'
    - require:
      - cmd: deark-extract

deark-folder-rename:
  file.rename:
    - name: '{{ inpath }}\deark'
    - source: '{{ inpath }}\deark-{{ version }}\'
    - force: True
    - require:
      - cmd: deark-extract

deark-shim:
  cmd.run:
    - name: 'powershell -nop -ep Bypass -File {{ inpath }}\New-Shim.ps1 -SourceExe {{ inpath }}\deark\x64\deark.exe -OutPath {{ inpath }}\shims\deark.exe'
    - require:
      - sls: winfor.config.shims
