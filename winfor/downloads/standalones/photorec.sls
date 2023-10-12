# Name: photorec / testdisk
# Website: https://www.cgsecurity.org/
# Description: Raw data parsing tool
# Category: Raw Parsers / Decoders
# Author: Christophe Grenier
# License: GNU General Public License v2.0 (https://git.cgsecurity.org/cgit/testdisk/tree/COPYING)
# Version: 7.1
# Notes:

{% set version = '7.1' %}
{% set hash = '2A82C5F4A29EE467AB1EFF82BAD1F9C10F71569512161ACFABD58E9B8A3DA314' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

testdisk-download-only:
  file.managed:
    - name: '{{ downloads }}\photorec\testdisk-{{ version }}.win64.zip'
    - source: https://www.cgsecurity.org/testdisk-{{ version }}.win64.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
