# Name: TeraCopy
# Website: https://www.codesector.com/teracopy
# Description: File transfer utility for consistent and uninterrupted transfers
# Category: Utilities
# Author: Code Sector
# License: FREEWARE (private / non-commerical)
# Version: 4.0.0.27
# Notes:

{% set version = '4.0.0.27' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set hash = '36fbcc347d3cedfaebe3d64dd8dd9b6df351e59ef783c8241ce21df255bddad4' %}

teracopy-download-only:
  file.managed:
    - name: '{{ downloads }}\teracopy\teracopy-{{ version }}.exe'
    - source: https://www.codesector.com/files/teracopy{{ version }}.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True

