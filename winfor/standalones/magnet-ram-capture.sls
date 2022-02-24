# Name: 
# Website: 
# Description: 
# Category: 
# Author: 
# License: 
# Notes:

{% set hash = '72dc1ba6ddc9d572d70a194ebdf6027039734ecee23a02751b0b3b3c4ea430de' %}
{% set version = 'v120' %}

magnet-ram-capture-download:
  file.managed:
    - name: 'C:\standalone\magnet\RAMCapture\MRC{{version}}.exe'
    - source: https://storage.googleapis.com/mfi-files/free_tools/MagnetRAMCapture/MRC{{ version }}.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
