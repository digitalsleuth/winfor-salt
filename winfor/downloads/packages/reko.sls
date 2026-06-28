# Name: Reko
# Website: https://github.com/uxmal/reko
# Description: Binary decompiler
# Category: Executables
# Author: uxmal et al (https://github.com/uxmal/reko/blob/master/AUTHORS)
# License: GNU General Public License 2.0 (https://github.com/uxmal/reko/blob/master/COPYING)
# Version: 0.12.3
# Notes:

{% set version = '0.12.3' %}
{% set ver_hash = 'f6a16a2abd' %}
{% set hash = '35f06785ef2f2db6badcf1b32426bc23325cdaeb48192768eb84eba9486c2e53' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

reko-download-only:
  file.managed:
    - name: '{{ downloads }}\reko\reko-{{ version }}.msi'
    - source: https://github.com/uxmal/reko/releases/download/version-{{ version }}/Reko-{{ version }}-x64-{{ ver_hash }}.msi
    - source_hash: sha256={{ hash }}
    - makedirs: True
