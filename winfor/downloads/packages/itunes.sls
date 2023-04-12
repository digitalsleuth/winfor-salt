# Name: Apple iTunes
# Website: https://www.apple.com
# Description: Media viewer and Apple device manager
# Category: Utilities
# Author: Apple
# License: EULA
# Version: 12.12.8.2
# Notes:

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '12.12.8.2' %}
{% set hash = 'f47b36ebd5793dbd608477075ba723ead14232a3851bad7fc0c15943f4efbf72' %}

itunes-download-only:
  file.managed:
    - name: '{{ downloads }}\iTunes64Setup.exe'
    - source: https://secure-appldnld.apple.com/itunes12/032-43416-20230329-5563B273-069B-4902-8997-39A886456E7B/iTunes64Setup.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
