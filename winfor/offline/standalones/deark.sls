# Name: deark
# Website: https://entropymine.com/deark/
# Description: Portable command-line utility to decode file types
# Category: Raw Parsers / Decoders
# Author: Jason Summers
# License: MIT (https://github.com/jsummers/deark/blob/master/COPYING)
# Version: 1.7.2
# Notes: 

{% set version = '1.7.2' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}

include:
  - winfor.offline.packages.7zip
  - winfor.config.shims

deark-extract-offline:
  cmd.run:
    - name: '"C:\Program Files\7-Zip\7z.exe" x {{ downloads }}\deark\deark-{{ version }}.tar.gz -o"{{ inpath }}\" -y && "C:\Program Files\7-Zip\7z.exe" x {{ inpath }}\deark-{{ version }}.tar -o"{{ inpath}}\"'
    - shell: cmd
    - require:
      - sls: winfor.offline.packages.7zip

deark-delete-tar-offline:
  file.absent:
    - name: '{{ inpath }}\deark-{{ version }}.tar'
    - require:
      - cmd: deark-extract-offline

deark-folder-rename-offline:
  file.rename:
    - name: '{{ inpath }}\deark'
    - source: '{{ inpath }}\deark-{{ version }}\'
    - force: True
    - require:
      - cmd: deark-extract-offline

deark-shim-offline:
  cmd.run:
    - name: 'powershell -nop -ep Bypass -File {{ inpath }}\New-Shim.ps1 -SourceExe {{ inpath }}\deark\x64\deark.exe -OutPath {{ inpath }}\shims\deark.exe'
    - require:
      - sls: winfor.config.shims
