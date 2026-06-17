# Name: OpenHashTab
# Website: https://github.com/namazso/OpenHashTab
# Description: Shell extension for file hashing
# Category: Utilities
# Author: namazso
# License: GNU General Public License 3.0 (https://github.com/namazso/OpenHashTab/blob/master/COPYING)
# Version: 3.0.4
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '3.0.4' %}
{% set hash = '9966e3ed6693dfc42904a2aaa1b294a2cd1edd059ef795729a76956cc21cd239' %}

openhashtab-download-only:
  file.managed:
    - name: '{{ downloads }}\openhashtab\OpenHashTab_setup-{{ version }}.exe'
    - source: https://github.com/namazso/OpenHashTab/releases/download/v{{ version }}/OpenHashTab_setup.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
