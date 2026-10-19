# Name: MS Word Parser
# Website: https://github.com/jjrboucher/MS-Word-Parser
# Description: MS Word document analysis tool
# Category: Documents / Editors
# Author: Jacques Boucher (jjrboucher) / Corey Forman (digitalsleuth)
# License: MIT License (https://github.com/jjrboucher/MS-Word-Parser/blob/master/LICENSE)
# Version: 3.0.1
# Notes:

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '3.0.1' %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('ms-word-parser') %}

ms-word-parser-download-only:
  file.managed:
    - name: '{{ downloads }}\ms-word-parser\ms-word-parser-{{ version }}.exe'
    - source: https://github.com/jjrboucher/MS-Word-Parser/releases/download/v{{ version }}/parse-docx-v{{ version }}.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
