# Name: Tableau Firmware Update
# Website: https://www.opentext.com
# Description: Firmware update utility for Tableau forensic devices
# Category: Utilities
# Author: OpenText
# License: EULA
# Version: 25.4.17
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '25.4' %}
{% set hash = '90cb1591aa1571426bd29502197fd7fd972d96b95fa18843ad179a660a41c0ab' %}

tableau-firmware-update-download-only:
  file.managed:
    - name: '{{ downloads }}\tableau\setup_tableau_firmware_update_{{ version }}.msi'
    - source: https://digitalintelligence.com/files/setup_tableau_firmware_update_{{ version }}.msi
    - source_hash: sha256={{ hash }}
    - makedirs: True
