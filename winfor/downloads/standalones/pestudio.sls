# Name: PEStudio
# Website: https://www.winitor.com
# Description: PE Analysis Tool
# Category: Executables
# Author: Marc Ochsenmeier
# License: As-Is, without warranty (https://www.winitor.com/tools/pestudio/changes.log)
# Version: 9.51
# Notes: 

{% set hash = '338def87bbaebac4d18b8a4b74a8445e3f8fe21e741f92701f705a9749250818' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

pestudio-download-only:
  file.managed:
    - name: '{{ downloads }}\pestudio.zip'
    - source: https://www.winitor.com/tools/pestudio/current/pestudio.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
