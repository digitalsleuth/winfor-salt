# Name: PEStudio
# Website: https://www.winitor.com
# Description: PE Analysis Tool
# Category: Executables
# Author: Marc Ochsenmeier
# License: As-Is, without warranty (https://www.winitor.com/tools/pestudio/changes.log)
# Version: 9.49
# Notes: 

{% set hash = '2069d3ff8ba5b523d4ccc76a8c8191a1510f04dad75ea23e35eb0d14f8c97c07' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

pestudio-download-only:
  file.managed:
    - name: '{{ downloads }}\pestudio.zip'
    - source: https://www.winitor.com/tools/pestudio/current/pestudio.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
