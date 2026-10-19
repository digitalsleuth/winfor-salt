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
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('libreoffice') %}

libreoffice-download-only:
  file.managed:
    - name: '{{ downloads }}\libreoffice\libreoffice-{{ version }}.msi'
    - source: https://downloadarchive.documentfoundation.org/libreoffice/old/{{ version }}/win/x86_64/LibreOffice_{{ version }}_Win_x86-64.msi
    - source_hash: sha256={{ hash }}
    - makedirs: True
