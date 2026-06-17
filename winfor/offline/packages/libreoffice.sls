# Name: Libre Office
# Website: https://www.libreoffice.org
# Description: Open Source Office Document suite
# Category: Documents / Editors
# Author: LibreOffice
# License: Mozilla Public License (https://www.libreoffice.org/download/license/)
# Version: 7.6.2.1
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '7.6.2.1' %}
{% set hash = 'f6a3f0794b957e7e95219064639b2a67a315158e614c8cee58a352286b8f38ed' %}

libreoffice-download-only:
  file.managed:
    - name: '{{ downloads }}\libreoffice\LibreOffice_{{ version }}_Win_x86-64.msi'
    - source: https://downloadarchive.documentfoundation.org/libreoffice/old/{{ version }}/win/x86_64/LibreOffice_{{ version }}_Win_x86-64.msi
    - source_hash: sha256={{ hash }}
    - makedirs: True
