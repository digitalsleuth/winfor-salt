# Name: OpenHashTab
# Website: https://github.com/namazso/OpenHashTab
# Description: Shell extension for file hashing
# Category: Utilities
# Author: namazso
# License: GNU General Public License 3.0 (https://github.com/namazso/OpenHashTab/blob/master/COPYING)
# Version: 3.0.5
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '3.0.5' %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('openhashtab') %}

openhashtab-download-only:
  file.managed:
    - name: '{{ downloads }}\openhashtab\openhashtab-{{ version }}.exe'
    - source: https://github.com/namazso/OpenHashTab/releases/download/v{{ version }}/OpenHashTab_setup.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
