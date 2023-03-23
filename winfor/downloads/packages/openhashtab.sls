# Name: OpenHashTab
# Website: https://github.com/namazso/OpenHashTab
# Description: Shell extension for file hashing
# Category: Utilities
# Author: namazso
# License: GNU General Public License 3.0 (https://github.com/namazso/OpenHashTab/blob/master/COPYING)
# Version: 3.0.2
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '3.0.2' %}
{% set hash = '1B5A0475B0EC3CB211E3F710FA8C0A2CD5CE971475104DE91B2AEB7F865B96E6' %}

openhashtab-download-only:
  file.managed:
    - name: '{{ downloads }}\OpenHashTab_setup.exe'
    - source: https://github.com/namazso/OpenHashTab/releases/download/v{{ version }}/OpenHashTab_setup.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
