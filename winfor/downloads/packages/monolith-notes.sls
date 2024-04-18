# Name: Monolith Notes
# Website: https://www.monolithforensics.com/
# Description: Forensic note taking and tracking tool
# Category: Utilities
# Author: Monolith Forensics
# License: EULA
# Version: 1.0.2
# Notes:

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '1.0.2' %}
{% set hash = '0e0e70ef1cd3d66127fcfe139d8f9b146f08824352ffebb758cef23aa03bf8d5' %}

monolith-notes-download-only:
  file.managed:
    - name: '{{ downloads }}\monolith\Monolith Notes Setup-{{ version }}.exe'
    - source: https://monolith-cloud.nyc3.cdn.digitaloceanspaces.com/updates/notes/Monolith%20Notes%20Setup.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
