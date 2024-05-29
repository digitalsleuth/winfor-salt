# Name: ClamAV
# Website: https://www.clamav.net
# Description: Open Source Antivirus
# Category: Utilities
# Author: Cisco / Talos - https://www.clamav.net/about
# License: GNU General Public License v2.0 (https://github.com/Cisco-Talos/clamav/blob/main/COPYING.txt)
# Version: 1.3.1
# Notes:

{% set version = '1.3.1' %}
{% set hash = '90806b663b863ae32aaaa2b750f56db10b91d876de9081b666cd1863ed380179' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

clamav-download-only:
  file.managed:
    - name: '{{ downloads }}\clamav\clamav-{{ version }}.win.x64.msi'
    - source: https://www.clamav.net/downloads/production/clamav-{{ version }}.win.x64.msi
    - source_hash: sha256={{ hash }}
    - makedirs: True
