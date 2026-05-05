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
{% set hash = 'c26068186f63dcce9cc57502be742c728110eab07570c319a0d7d10587a6e22d' %}

pdfstreamdumper-download-only:
  file.managed:
    - name: '{{ downloads }}\pdfstreamdumper\PDFStreamDumper_Setup-{{ version }}.exe'
    - source: http://sandsprite.com/CodeStuff/PDFStreamDumper_Setup.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
