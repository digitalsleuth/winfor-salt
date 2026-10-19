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
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('monolith-notes') %}

monolith-notes-download-only:
  file.managed:
    - name: '{{ downloads }}\monolith-notes\monolith-notes-{{ version }}.exe'
    - source: https://monolith-cloud.nyc3.cdn.digitaloceanspaces.com/updates/notes/Monolith%20Notes%20Setup.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
