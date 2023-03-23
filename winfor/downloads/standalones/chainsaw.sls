# Name: Chainsaw
# Website: https://github.com/WithSecureLabs/Chainsaw
# Description: Event Log and Windows Artefact Parser
# Category: Windows Analysis
# Author: WithSecureLabs / Countercept
# License: GNU General Public License v3.0 (https://github.com/WithSecureLabs/chainsaw/blob/master/LICENCE)
# Version: 2.3.1
# Notes:

{% set version = '2.3.1' %}
{% set hash = '443C158C64502131ACA786C87F000BA6F8EC54F860A792060461BE08EB071DF3' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

chainsaw-download-only:
  file.managed:
    - name: '{{ downloads }}\chainsaw_all_platforms+rules+examples.zip'
    - source: https://github.com/WithSecureLabs/chainsaw/releases/download/v{{ version }}/chainsaw_all_platforms+rules+examples.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
