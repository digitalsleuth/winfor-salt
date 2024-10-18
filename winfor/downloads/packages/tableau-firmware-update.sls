# Name: Tableau Firmware Update
# Website: https://www.opentext.com
# Description: Firmware update utility for Tableau forensic devices
# Category: Utilities
# Author: OpenText
# License: EULA
# Version: 24.3.3
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '24.3' %}
{% set hash = '7300de0f4db47c7ba7c1f50e1a40b9f9f46f6fc89ee471b9d62492dcfa1821bf' %}

tableau-firmware-update-download-only:
  file.managed:
    - name: '{{ downloads }}\tableau\setup_tableau_firmware_update_{{ version }}.msi'
    - source: https://mimage.opentext.com/support/ecm/tableau/setup_tableau_firmware_update_{{ version }}.msi
    - source_hash: sha256={{ hash }}
    - makedirs: True
