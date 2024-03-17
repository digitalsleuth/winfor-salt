# Name: synchrony
# Website: https://github.com/relative/synchrony
# Description: Javascript Cleaner and Deobfuscator
# Category: Raw Parsers / Decoders
# Author: relative
# License: GNU General Public License v3 (https://github.com/relative/synchrony/blob/master/LICENSE.md)
# Version: 2.4.5
# Notes: Requires nodejs to install, command is 'synchrony'

{% set version = '2.4.5' %}
{% set hash = '6eee6c549830c793379ffdc30e7feb5fc6cc1407bd5402df3e828357b78086c4' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

synchrony-download-only:
  file.managed:
    - name: '{{ downloads }}\synchrony\synchrony-v{{ version }}.zip'
    - source: https://github.com/relative/synchrony/archive/refs/tags/{{ version }}.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
