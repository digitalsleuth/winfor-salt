# Name: Monolith Notes
# Website: https://www.monolithforensics.com/
# Description: Forensic note taking and tracking tool
# Category: Utilities
# Author: Monolith Forensics
# License: EULA
# Version: 2.0.2
# Notes:

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '2.0.2' %}
{% set hash = '422fcc3c7c77d6f3b100051ddf47cf2c7c1f9405c8edfcc0f5d71d666f407499' %}

monolith-notes-download-only:
  file.managed:
    - name: '{{ downloads }}\monolith\Monolith Notes Setup-{{ version }}.exe'
    - source: https://monolith-cloud.nyc3.cdn.digitaloceanspaces.com/updates/notes/Monolith%20Notes%20Setup.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
