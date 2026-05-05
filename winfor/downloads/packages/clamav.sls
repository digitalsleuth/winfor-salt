# Name: ClamAV
# Website: https://www.clamav.net
# Description: Open Source Antivirus
# Category: Utilities
# Author: Cisco / Talos - https://www.clamav.net/about
# License: GNU General Public License v2.0 (https://github.com/Cisco-Talos/clamav/blob/main/COPYING.txt)
# Version: 1.4.4
# Notes:

{% set version = '1.4.4' %}
{% set hash = '867310acc193f94b2e0c5d3cb1aeebd832062767529bcf6ac6f8f9e62811dbc8' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

clamav-download-only:
  file.managed:
    - name: '{{ downloads }}\clamav\clamav-{{ version }}.win.x64.msi'
    - source: https://www.clamav.net/downloads/production/clamav-{{ version }}.win.x64.msi
    - source_hash: sha256={{ hash }}
    - makedirs: True
