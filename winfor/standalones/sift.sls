# Name: sift
# Website: https://sift-tool.org/
# Description: A fast and powerful alternative to grep
# Category: Raw Parsers / Decoders
# Author: Sven Taute
# License: GNU General Public License v3.0 (https://github.com/svent/sift/blob/master/LICENSE)
# Version: 0.9.2
# Notes:

{% set version = '0.9.2' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set hash = '3ddcc65ffb90381019e6bcf0f928ecc116f299aa6a45badfae2f44317f85381c' %}

include:
  - winfor.config.shims

sift-download:
  file.managed:
    - name: 'C:\salt\tempdownload\sift-{{ version }}.zip'
    - source: https://github.com/svent/sift/releases/download/v{{ version }}/sift_{{ version }}_Windows_x86_64.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

sift-extract:
  archive.extracted:
    - name: '{{ inpath }}\sift'
    - source: 'C:\salt\tempdownload\sift-{{ version }}.zip'
    - enforce_toplevel: False
    - require:
      - file: sift-download

sift-shim:
  cmd.run:
    - name: 'powershell -nop -ep Bypass -File {{ inpath }}\New-Shim.ps1 -SourceExe {{ inpath }}\sift\sift.exe -OutPath {{ inpath }}\shims\sift.exe'
    - require:
      - sls: winfor.config.shims
      - archive: sift-extract
