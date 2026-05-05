# Name: 1768.py
# Website: https://github.com/didierstevens/didierstevenssuite
# Description: Cobalt Strike Beacon Analysis Tool
# Category: Raw Parsers / Decoders
# Author: Didier Stevens
# License: Public Domain
# Version: 0.0.23
# Notes:

{% set version = '0.0.23' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set hash = '38aed900f5fe0c9272e66451266ab6888401b95c50920eff268bbbba4db4b040' %}

include:
  - winfor.standalones.portable-python3

1768-download-only:
  file.managed:
    - name: '{{ downloads }}\1768\1768-{{ version }}.py'
    - source: https://github.com/DidierStevens/DidierStevensSuite/raw/refs/heads/master/1768.py
    - source_hash: sha256={{ hash }}
    - makedirs: True

1768-requirements-download-only:
  cmd.run:
    - name: '{{ inpath }}\portable-python3\python.exe -m pip download pefile peutils -d packages'
    - cwd: '{{ downloads }}\1768'
    - require:
      - file: 1768-download-only
      - sls: winfor.standalones.portable-python3
