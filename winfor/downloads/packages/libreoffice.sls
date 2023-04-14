# Name: Libre Office
# Website: https://www.libreoffice.org
# Description: Open Source Office Document suite
# Category: Documents / Editors
# Author: LibreOffice
# License: Mozilla Public License (https://www.libreoffice.org/download/license/)
# Version: 7.5.2.2
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '7.5.2.2' %}
{% set hash = '638e93876e8345666f1cf3e968373a90add5d420094a6ec8871edcda94a440e8' %}

libreoffice-download-only:
  file.managed:
    - name: '{{ downloads }}\LibreOffice_{{ version }}_Win_x86-64.msi'
    - source: https://downloadarchive.documentfoundation.org/libreoffice/old/{{ version }}/win/x86_64/LibreOffice_{{ version }}_Win_x86-64.msi
    - source_hash: sha256={{ hash }}
    - makedirs: True
