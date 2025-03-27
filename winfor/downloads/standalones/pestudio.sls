# Name: PEStudio
# Website: https://www.winitor.com
# Description: PE Analysis Tool
# Category: Executables
# Author: Marc Ochsenmeier
# License: As-Is, without warranty (https://www.winitor.com/tools/pestudio/changes.log)
# Version: 9.61
# Notes: 

{% set hash = '7ebbb5e97644b000aab1af70663e2766b66f5731c677dbd6e40c2ff5d6d2fc57' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '9.61' %}

pestudio-download-only:
  file.managed:
    - name: '{{ downloads }}\pestudio\pestudio-{{ version }}.zip'
    - source: https://www.winitor.com/tools/pestudio/current/pestudio.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
