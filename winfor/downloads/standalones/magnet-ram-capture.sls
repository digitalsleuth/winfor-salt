# Name: Magnet RAM Capture (MRC)
# Website: https://magnetforensics.com
# Description: Windows memory capture utility
# Category: Acquisition and Analysis
# Author: Magnet Forensics
# License: EULA
# Version: 1.2.0
# Notes:

{% set version = '1.2.0' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('magnet-ram-capture') %}

magnet-ram-capture-download-only:
  file.managed:
    - name: '{{ downloads }}\magnetforensics\magnet-ram-capture-{{ version }}.exe'
    - source: https://storage.googleapis.com/mfi-files/free_tools/MagnetRAMCapture/MRCv{{ version | replace(".","") }}.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
