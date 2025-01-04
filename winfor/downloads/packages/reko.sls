# Name: Reko
# Website: https://github.com/uxmal/reko
# Description: Binary decompiler
# Category: Executables
# Author: uxmal et al (https://github.com/uxmal/reko/blob/master/AUTHORS)
# License: GNU General Public License 2.0 (https://github.com/uxmal/reko/blob/master/COPYING)
# Version: 0.11.6
# Notes:

{% set version = '0.11.6' %}
{% set ver_hash = '58fe816db3' %}
{% set hash = 'eb8bd9801d125f7c648a52c89878cbce0e83595db9772adec2e8067b2c977c75' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

reko-download-only:
  file.managed:
    - name: '{{ downloads }}\reko\Reko-{{ version }}-x64-{{ hash }}.msi'
    - source: https://github.com/uxmal/reko/releases/download/version-{{ version }}/Reko-{{ version }}-x64-{{ ver_hash }}.msi
    - source_hash: sha256={{ hash }}
    - makedirs: True
