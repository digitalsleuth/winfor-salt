# Name: PDFStream Dumper
# Website: https://github.com/dzzie/pdfstreamdumper
# Description: PDF Analysis tool
# Category: Documents / Editors
# Author: David Zimmer (dzzie)
# License: None
# Version: 0.9.624
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '0.9.624' %}
{% set hash = '3297d271db055194a65f2f46fa073e2cd112c62e5b23cdedffe292ac21637599' %}

pdfstreamdumper-download-only:
  file.managed:
    - name: '{{ downloads }}\PDFStreamDumper_Setup.exe'
    - source: https://github.com/dzzie/pdfstreamdumper/releases/download/current/PDFStreamDumper_Setup.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
