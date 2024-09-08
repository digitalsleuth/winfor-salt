# Name: Magnet RESPONSE
# Website: https://magnetforensics.com
# Description: Tool to collect data relevant to incident response investigations
# Category: Acquisition and Analysis
# Author: Magnet Forensics
# License: EULA
# Version: 1.71
# Notes:

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set hash = '426f6878add75b54a78f2a4e029b96d3a759cf4762345d5e3f95591a533319e4' %}
{% set version = '171' %}

magnet-response-download-only:
  file.managed:
    - name: '{{ downloads }}\magnetforensics\MagnetRESPONSEv{{ version }}.exe'
    - source: https://storage.googleapis.com/mfi-files/free_tools/MagnetRESPONSE/MagnetRESPONSEv{{ version }}_Self_Extracting_Archive.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
