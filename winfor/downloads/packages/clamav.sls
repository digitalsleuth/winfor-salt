# Name: ClamAV
# Website: https://www.clamav.net
# Description: Open Source Antivirus
# Category: Utilities
# Author: Cisco / Talos - https://www.clamav.net/about
# License: GNU General Public License v2.0 (https://github.com/Cisco-Talos/clamav/blob/main/COPYING.txt)
# Version: 1.4.2
# Notes:

{% set version = '1.4.2' %}
{% set hash = '65308fd2ad2d550206380e406fed22f74b49c35b3f39ed8cc28d52363c8f1f2b' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

clamav-download-only:
  file.managed:
    - name: '{{ downloads }}\clamav\clamav-{{ version }}.win.x64.msi'
    - source: https://www.clamav.net/downloads/production/clamav-{{ version }}.win.x64.msi
    - source_hash: sha256={{ hash }}
    - makedirs: True
