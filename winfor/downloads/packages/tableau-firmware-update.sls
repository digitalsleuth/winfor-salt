# Name: Tableau Firmware Update
# Website: https://www.opentext.com
# Description: Firmware update utility for Tableau forensic devices
# Category: Utilities
# Author: OpenText
# License: EULA
# Version: 25.4.17
# Notes: 

{% set version = '25.4.17' %}
{% set short_ver = version.rsplit('.', 1)[0] %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('tableau-firmware-update') %}

tableau-firmware-update-download-only:
  file.managed:
    - name: '{{ downloads }}\tableau\tableau-firmware-update-{{ version }}.msi'
    - source: https://digitalintelligence.com/files/setup_tableau_firmware_update_{{ short_ver }}.msi
    - source_hash: sha256={{ hash }}
    - makedirs: True

tableau-certificate-copy-download-only:
  file.managed:
    - name: '{{ downloads }}\tableau\tableau.cer'
    - source: salt://winfor/files/tableau.cer
    - makedirs: True
