# Name: Chainsaw
# Website: https://github.com/WithSecureLabs/Chainsaw
# Description: Event Log and Windows Artefact Parser
# Category: Windows Analysis
# Author: WithSecureLabs / Countercept
# License: GNU General Public License v3.0 (https://github.com/WithSecureLabs/chainsaw/blob/master/LICENCE)
# Version: 2.14.1
# Notes:

{% set version = '2.14.1' %}
{% set hash = '13e66ca0ddd00561eeba483a6ae98629f6f12eb3019d14d3f83e2d03484f585a' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

chainsaw-download-only:
  file.managed:
    - name: '{{ downloads }}\chainsaw\chainsaw-{{ version }}.zip'
    - source: https://github.com/WithSecureLabs/chainsaw/releases/download/v{{ version }}/chainsaw_all_platforms+rules+examples.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
