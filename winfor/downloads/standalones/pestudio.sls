# Name: PEStudio
# Website: https://www.winitor.com
# Description: PE Analysis Tool
# Category: Executables
# Author: Marc Ochsenmeier
# License: As-Is, without warranty (https://www.winitor.com/tools/pestudio/changes.log)
# Version: 9.50
# Notes: 

{% set hash = 'a544d14f3fa9ef2d371d078417828d6e7731e2a636534041339b6d806ff2f49c' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

pestudio-download-only:
  file.managed:
    - name: '{{ downloads }}\pestudio.zip'
    - source: https://www.winitor.com/tools/pestudio/current/pestudio.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
