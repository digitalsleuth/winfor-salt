# Name: Magnet RESPONSE
# Website: https://magnetforensics.com
# Description: Tool to collect data relevant to incident response investigations
# Category: Acquisition and Analysis
# Author: Magnet Forensics
# License: EULA
# Version: 1.70
# Notes:

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set hash = '9bf9ee79a7ddeecf4ac25fea509e1ddbd569c97be46c301a1e5f808edfa0ea3e' %}
{% set version = '170' %}

magnet-response-download:
  file.managed:
    - name: 'C:\salt\tempdownload\MagnetRESPONSEv{{ version }}.zip'
    - source: https://storage.googleapis.com/mfi-files/free_tools/MagnetRESPONSE/MagnetRESPONSEv{{ version }}.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

magnet-response-extract:
  archive.extracted:
    - name: '{{ inpath }}\magnet\Response\'
    - source: 'C:\salt\tempdownload\MagnetRESPONSEv{{ version }}.zip'
    - enforce_toplevel: False
    - require:
      - file: magnet-response-download
