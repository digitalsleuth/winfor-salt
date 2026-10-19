# Name: TeraCopy
# Website: https://www.codesector.com/teracopy
# Description: File transfer utility for consistent and uninterrupted transfers
# Category: Utilities
# Author: Code Sector
# License: FREEWARE (private / non-commerical)
# Version: 4.0.0.37
# Notes:

{% set version = '4.0.0.37' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('teracopy') %}

teracopy-download-only:
  file.managed:
    - name: '{{ downloads }}\teracopy\teracopy-{{ version }}.exe'
    - source: https://www.codesector.com/files/teracopy{{ version }}.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True

