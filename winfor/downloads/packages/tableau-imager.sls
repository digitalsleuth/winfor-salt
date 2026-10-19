# Name: Tableau Imager
# Website: https://opentext.com
# Description: Disk / Device Imager
# Category: Acquisition and Analysis
# Author: OpenText
# License: EULA
# Version: 20.3.3
# Notes:

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '20.3' %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('tableau-imager') %}

tableau-imager-download-only:
  file.managed:
    - name: '{{ downloads }}\tableau\tableau-imager-{{ version }}.msi'
    - source: https://mimage.opentext.com/support/ecm/tableau/setup_tableau_imager_{{ version }}.msi
    - source_hash: sha256={{ hash }}
    - makedirs: True
