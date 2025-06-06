# Name: Reko
# Website: https://github.com/uxmal/reko
# Description: Binary decompiler
# Category: Executables
# Author: uxmal et al (https://github.com/uxmal/reko/blob/master/AUTHORS)
# License: GNU General Public License 2.0 (https://github.com/uxmal/reko/blob/master/COPYING)
# Version: 0.12.0
# Notes:

{% set version = '0.12.0' %}
{% set ver_hash = '99a6fb0170' %}
{% set hash = 'a73c9cc6a4c9bf8ffcb5077ea2ccc096da97cb4f297c800642b70393989c19cc' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

reko-download-only:
  file.managed:
    - name: '{{ downloads }}\reko\Reko-{{ version }}-x64-{{ hash }}.msi'
    - source: https://github.com/uxmal/reko/releases/download/version-{{ version }}/Reko-{{ version }}-x64-{{ ver_hash }}.msi
    - source_hash: sha256={{ hash }}
    - makedirs: True
