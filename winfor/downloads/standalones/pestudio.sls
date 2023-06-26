# Name: PEStudio
# Website: https://www.winitor.com
# Description: PE Analysis Tool
# Category: Executables
# Author: Marc Ochsenmeier
# License: As-Is, without warranty (https://www.winitor.com/tools/pestudio/changes.log)
# Version: 9.53
# Notes: 

{% set hash = 'ded56a58d7c5e06453f22a875d6a58ec0c07031e1c0873acc06b288a2d9658d8' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

pestudio-download-only:
  file.managed:
    - name: '{{ downloads }}\pestudio.zip'
    - source: https://www.winitor.com/tools/pestudio/current/pestudio.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
