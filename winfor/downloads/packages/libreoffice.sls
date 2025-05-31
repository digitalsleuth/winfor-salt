# Name: Libre Office
# Website: https://www.libreoffice.org
# Description: Open Source Office Document suite
# Category: Documents / Editors
# Author: LibreOffice
# License: Mozilla Public License (https://www.libreoffice.org/download/license/)
# Version: 25.2.4.1
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '25.2.4.1' %}
{% set hash = '06b52ed635d4d8f38953a8e44fe31946e118baf6c61832bc445d44b0dd63055c' %}

libreoffice-download-only:
  file.managed:
    - name: '{{ downloads }}\libreoffice\LibreOffice_{{ version }}_Win_x86-64.msi'
    - source: https://downloadarchive.documentfoundation.org/libreoffice/old/{{ version }}/win/x86_64/LibreOffice_{{ version }}_Win_x86-64.msi
    - source_hash: sha256={{ hash }}
    - makedirs: True
