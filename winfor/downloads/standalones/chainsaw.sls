# Name: Chainsaw
# Website: https://github.com/WithSecureLabs/Chainsaw
# Description: Event Log and Windows Artefact Parser
# Category: Windows Analysis
# Author: WithSecureLabs / Countercept
# License: GNU General Public License v3.0 (https://github.com/WithSecureLabs/chainsaw/blob/master/LICENCE)
# Version: 2.8.1
# Notes:

{% set version = '2.8.1' %}
{% set hash = '2881fc8a3999281b05f4edbfa8941e518c83f60a53d713076f8df666cadae17f' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

chainsaw-download-only:
  file.managed:
    - name: '{{ downloads }}\chainsaw\chainsaw-{{ version }}.zip'
    - source: https://github.com/WithSecureLabs/chainsaw/releases/download/v{{ version }}/chainsaw_all_platforms+rules+examples.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
