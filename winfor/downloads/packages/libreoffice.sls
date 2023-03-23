# Name: Libre Office
# Website: https://www.libreoffice.org
# Description: Open Source Office Document suite
# Category: Documents / Editors
# Author: LibreOffice
# License: Mozilla Public License (https://www.libreoffice.org/download/license/)
# Version: 7.5.2
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '7.5.2.1' %}
{% set hash = '194d9a580ede9b85e484f3fa13d85d4d27e81075d49f440965bbebc376f52681' %}

libreoffice-download-only:
  file.managed:
    - name: '{{ downloads }}\LibreOffice_{{ version }}_Win_x86-64.msi'
    - source: https://downloadarchive.documentfoundation.org/libreoffice/old/{{ version }}/win/x86_64/LibreOffice_{{ version }}_Win_x86-64.msi
    - source_hash: sha256={{ hash }}
    - makedirs: True
