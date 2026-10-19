# Name: photorec / testdisk
# Website: https://www.cgsecurity.org/
# Description: Raw data parsing tool
# Category: Raw Parsers / Decoders
# Author: Christophe Grenier
# License: GNU General Public License v2.0 (https://git.cgsecurity.org/cgit/testdisk/tree/COPYING)
# Version: 7.2
# Notes:

{% set version = '7.2' %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('photorec') %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

testdisk-download-only:
  file.managed:
    - name: '{{ downloads }}\photorec\testdisk-{{ version }}.zip'
    - source: https://www.cgsecurity.org/testdisk-{{ version }}.win64.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
