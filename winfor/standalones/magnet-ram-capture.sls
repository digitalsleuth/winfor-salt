# Name: Magnet RAM Capture (MRC)
# Website: https://magnetforensics.com
# Description: Windows memory capture utility
# Category: Acquisition and Analysis
# Author: Magnet Forensics
# License: EULA
# Version: 1.2.0
# Notes:

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('magnet-ram-capture') %}
{% set version = 'v120' %}

magnet-ram-capture-download:
  file.managed:
    - name: '{{ inpath }}\magnet\RAMCapture\MRC{{version}}.exe'
    - source: https://storage.googleapis.com/mfi-files/free_tools/MagnetRAMCapture/MRC{{ version }}.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
