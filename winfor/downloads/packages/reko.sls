# Name: Reko
# Website: https://github.com/uxmal/reko
# Description: Binary decompiler
# Category: Executables
# Author: uxmal et al (https://github.com/uxmal/reko/blob/master/AUTHORS)
# License: GNU General Public License 2.0 (https://github.com/uxmal/reko/blob/master/COPYING)
# Version: 0.12.3
# Notes:

{% set version = '0.12.3' %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set ver_hash = get_hash('reko', 'ver_hash') %}
{% set hash = get_hash('reko') %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

reko-download-only:
  file.managed:
    - name: '{{ downloads }}\reko\reko-{{ version }}.msi'
    - source: https://github.com/uxmal/reko/releases/download/version-{{ version }}/Reko-{{ version }}-x64-{{ ver_hash }}.msi
    - source_hash: sha256={{ hash }}
    - makedirs: True
