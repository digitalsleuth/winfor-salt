# Name: PDFXplorer
# Website: https://pdfxplorer.dev
# Description: Graphical PDF debugger
# Category: Documents / Editors
# Author: PDF4DEV
# License: Proprietary (https://pdfxplorer.dev/licensing.html)
# Version: 5.1.0
# Notes: 

{% set version = "5.1.0" %}
{% set hash = 'f191ddf59ca92dbf1dc390f547366f9811eaaadc187de9e981622612bd831d8a' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

pdfxplorer-download-only:
  file.managed:
    - name: '{{ downloads }}\pdfxplorer\PDF4DEV.Applications.PDFXplorer.{{ version }}.msi'
    - source: https://pdfxplorer.dev/download/PDF4DEV.Applications.PDFXplorer.{{ version }}.msi
    - source_hash: sha256={{ hash }}
    - makedirs: True
