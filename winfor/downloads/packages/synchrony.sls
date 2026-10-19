# Name: synchrony
# Website: https://github.com/relative/synchrony
# Description: Javascript Cleaner and Deobfuscator
# Category: Raw Parsers / Decoders
# Author: relative
# License: GNU General Public License v3 (https://github.com/relative/synchrony/blob/master/LICENSE.md)
# Version: 2.4.6
# Notes: Requires nodejs to install, command is 'synchrony'

{% set version = '2.4.6' %}
{% set hash = 'e040c6db72f203d5920bf2993a726bd61e53adfdfe991dfc87a0c7e6316c0922' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

synchrony-download-only:
  file.managed:
    - name: '{{ downloads }}\synchrony\synchrony-{{ version }}.zip'
    - source: https://github.com/relative/synchrony/archive/refs/tags/{{ version }}.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
