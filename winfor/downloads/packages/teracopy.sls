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
{% set hash = 'c908d86999c11e731bf07c7a715a35dcba0893487d8deaf86b38842c00942f09' %}

teracopy-download-only:
  file.managed:
    - name: '{{ downloads }}\teracopy\teracopy-{{ version }}.exe'
    - source: https://www.codesector.com/files/teracopy{{ version }}.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True

