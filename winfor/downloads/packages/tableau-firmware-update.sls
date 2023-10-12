# Name: Tableau Firmware Update
# Website: https://www.opentext.com
# Description: Firmware update utility for Tableau forensic devices
# Category: Utilities
# Author: OpenText
# License: EULA
# Version: 22.3.2
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '22.3' %}
{% set hash = '72da20b80e25ff34d43c44e7f2844707cf21863d5524885a7cfdff1e2a9f7edf' %}

tableau-firmware-update-download-only:
  file.managed:
    - name: '{{ downloads }}\tableau\setup_tableau_firmware_update_{{ version }}.msi'
    - source: https://mimage.opentext.com/support/ecm/tableau/setup_tableau_firmware_update_{{ version }}.msi
    - source_hash: sha256={{ hash }}
    - makedirs: True
