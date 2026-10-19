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
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('pdfstreamdumper') %}

pdfstreamdumper-download-only:
  file.managed:
    - name: '{{ downloads }}\pdfstreamdumper\pdfstreamdumper-{{ version }}.exe'
    - source: https://github.com/digitalsleuth/salt-winrepo-ng/raw/refs/heads/main/files/PDFStreamDumper_Setup_{{ version }}.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
