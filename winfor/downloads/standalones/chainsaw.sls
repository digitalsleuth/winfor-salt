# Name: Chainsaw
# Website: https://github.com/WithSecureLabs/Chainsaw
# Description: Event Log and Windows Artefact Parser
# Category: Windows Analysis
# Author: WithSecureLabs / Countercept
# License: GNU General Public License v3.0 (https://github.com/WithSecureLabs/chainsaw/blob/master/LICENCE)
# Version: 2.7.3
# Notes:

{% set version = '2.7.3' %}
{% set hash = '788900d9961eb5e8be6245deb17273766852067d1aa41392bf040a8040d88a29' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

chainsaw-download-only:
  file.managed:
    - name: '{{ downloads }}\chainsaw_all_platforms+rules+examples.zip'
    - source: https://github.com/WithSecureLabs/chainsaw/releases/download/v{{ version }}/chainsaw_all_platforms+rules+examples.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
