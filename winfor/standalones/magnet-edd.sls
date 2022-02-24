# Name: 
# Website: 
# Description: 
# Category: 
# Author: 
# License: 
# Notes:

{% set hash = '89a3021f65c47386cdc12ab9788aa5523088cc03f480e9e28fef93216678d48f' %}
{% set version = 'v302' %}

magnet-edd-download:
  file.managed:
    - name: 'C:\salt\tempdownload\EDD{{ version }}.zip'
    - source: https://storage.googleapis.com/mfi-files/free_tools/EDD/EDD{{ version }}.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

magnet-edd-extract:
  archive.extracted:
    - name: 'C:\standalone\magnet\EDD\'
    - source: 'C:\salt\tempdownload\EDD{{ version }}.zip'
    - enforce_toplevel: False
    - require:
      - file: magnet-edd-download

