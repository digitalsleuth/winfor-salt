# Name: Monolith Notes
# Website: https://www.monolithforensics.com/
# Description: Forensic note taking and tracking tool
# Category: Utilities
# Author: Monolith Forensics
# License: EULA
# Version: 1.0.1
# Notes:

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '1.0.1' %}
{% set hash = '2e084582affcfed67442bed5c53fab91124d877b252ec0ba5a1db0941d3fa5ae' %}

monolith-notes-download-only:
  file.managed:
    - name: '{{ downloads }}\monolith\Monolith Notes Setup-{{ version }}.exe'
    - source: https://monolith-cloud.nyc3.cdn.digitaloceanspaces.com/updates/notes/Monolith%20Notes%20Setup.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
