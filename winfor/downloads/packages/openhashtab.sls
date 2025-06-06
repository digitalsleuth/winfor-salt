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
{% set hash = '98fb1f2d230dfa0a26915c5b314881fbb9fa76b9edbb720fdeaca35f3cb35f95' %}

openhashtab-download-only:
  file.managed:
    - name: '{{ downloads }}\openhashtab\OpenHashTab_setup-{{ version }}.exe'
    - source: https://github.com/namazso/OpenHashTab/releases/download/v{{ version }}/OpenHashTab_setup.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
