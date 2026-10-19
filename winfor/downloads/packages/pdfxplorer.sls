# Name: PDFXplorer
# Website: https://pdfxplorer.dev
# Description: Graphical PDF debugger
# Category: Documents / Editors
# Author: PDF4DEV
# License: Proprietary (https://pdfxplorer.dev/licensing.html)
# Version: 5.1.0
# Notes: 

{% set version = '5.1.0' %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('pdfxplorer') %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

pdfxplorer-download-only:
  file.managed:
    - name: '{{ downloads }}\pdfxplorer\pdfxplorer-{{ version }}.msi'
    - source: https://pdfxplorer.dev/download/PDF4DEV.Applications.PDFXplorer.{{ version }}.msi
    - source_hash: sha256={{ hash }}
    - makedirs: True
