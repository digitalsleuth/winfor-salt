# Name: photorec / testdisk
# Website: https://www.cgsecurity.org/
# Description: Raw data parsing tool
# Category: Raw Parsers / Decoders
# Author: Christophe Grenier
# License: GNU General Public License v2.0 (https://git.cgsecurity.org/cgit/testdisk/tree/COPYING)
# Version: 7.2
# Notes:

{% set version = '7.2' %}
{% set hash = 'e97e203ce77b6b1a3a37d01beccf069dc6c4632b579ffbb82ae739cdda229f38' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

testdisk-download-only:
  file.managed:
    - name: '{{ downloads }}\photorec\testdisk-{{ version }}.win64.zip'
    - source: https://www.cgsecurity.org/testdisk-{{ version }}.win64.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
