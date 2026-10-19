# Name: synchrony
# Website: https://github.com/relative/synchrony
# Description: Javascript Cleaner and Deobfuscator
# Category: Raw Parsers / Decoders
# Author: relative
# License: GNU General Public License v3 (https://github.com/relative/synchrony/blob/master/LICENSE.md)
# Version: 2.4.6
# Notes: Requires nodejs to install, command is 'synchrony'

{% set version = '2.4.6' %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('synchrony') %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

synchrony-download-only:
  file.managed:
    - name: '{{ downloads }}\synchrony\synchrony-{{ version }}.zip'
    - source: https://github.com/relative/synchrony/archive/refs/tags/{{ version }}.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
