# Name: PEStudio
# Website: https://www.winitor.com
# Description: PE Analysis Tool
# Category: Executables
# Author: Marc Ochsenmeier
# License: As-Is, without warranty (https://www.winitor.com/tools/pestudio/changes.log)
# Version: 9.48
# Notes: 

{% set hash = '93c9ccb715de39370070656d3b1959f01dd4dc16acbb0ad9a6a3cff32c1bcb00' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

pestudio-download-only:
  file.managed:
    - name: '{{ downloads }}\pestudio.zip'
    - source: https://www.winitor.com/tools/pestudio/current/pestudio.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
