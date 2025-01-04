# Name: TeraCopy
# Website: https://www.codesector.com/teracopy
# Description: File transfer utility for consistent and uninterrupted transfers
# Category: Utilities
# Author: Code Sector
# License: FREEWARE (private / non-commerical)
# Version: 3.17
# Notes:

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '317' %}

teracopy-download-only:
  file.managed:
    - name: '{{ downloads }}\teracopy\teracopy{{ version }}.exe'
    - source: https://www.codesector.com/files/teracopy.exe
    - skip_verify: True
    - makedirs: True

