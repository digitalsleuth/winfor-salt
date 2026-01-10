# Name: Chainsaw
# Website: https://github.com/WithSecureLabs/Chainsaw
# Description: Event Log and Windows Artefact Parser
# Category: Windows Analysis
# Author: WithSecureLabs / Countercept
# License: GNU General Public License v3.0 (https://github.com/WithSecureLabs/chainsaw/blob/master/LICENCE)
# Version: 2.13.1
# Notes:

{% set version = '2.13.1' %}
{% set hash = '58bbf38cbc897413c49076a7f9251c0705a8a2bbd70fb3a68a86653061c76725' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

chainsaw-download-only:
  file.managed:
    - name: '{{ downloads }}\chainsaw\chainsaw-{{ version }}.zip'
    - source: https://github.com/WithSecureLabs/chainsaw/releases/download/v{{ version }}/chainsaw_all_platforms+rules+examples.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
