# Name: PDFStream Dumper
# Website: http://sandsprite.com/blogs/index.php?uid=7&pid=57
# Description: PDF Analysis tool
# Category: Documents / Editors
# Author: David Zimmer (dzzie)
# License: None
# Version: 0.9.634
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '0.9.634' %}
{% set hash = '20b03a56b0febd2b30f6c2719d8cc9eaec98d8a20cb5c0859bb09c61b666f5b2' %}

pdfstreamdumper-download-only:
  file.managed:
    - name: '{{ downloads }}\pdfstreamdumper\PDFStreamDumper_Setup-{{ version }}.exe'
    - source: https://sandsprite.com/CodeStuff/PDFStreamDumper_Setup.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
