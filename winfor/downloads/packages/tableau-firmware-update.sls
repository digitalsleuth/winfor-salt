# Name: Tableau Firmware Update
# Website: https://www.opentext.com
# Description: Firmware update utility for Tableau forensic devices
# Category: Utilities
# Author: OpenText
# License: EULA
# Version: 23.4.3
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '23.4' %}
{% set hash = '9774e53015a5810d3841d67e569f9fdfb41d47cdb530c33571ec9025343c19dd' %}

tableau-firmware-update-download-only:
  file.managed:
    - name: '{{ downloads }}\tableau\setup_tableau_firmware_update_{{ version }}.msi'
    - source: https://mimage.opentext.com/support/ecm/tableau/setup_tableau_firmware_update_{{ version }}.msi
    - source_hash: sha256={{ hash }}
    - makedirs: True
