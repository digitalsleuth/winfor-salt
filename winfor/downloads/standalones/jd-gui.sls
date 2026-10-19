# Name: jd-gui
# Website: https://github.com/java-decompiler/jd-gui
# Description: GUI-based Java Decompiler
# Category: Mobile Analysis
# Author: Emmanuel Dupuy (emmanue1)
# License: GNU General Public License v3 (https://github.com/java-decompiler/jd-gui/blob/master/LICENSE)
# Version: 1.6.6
# Notes: 

{% set version = '1.6.6' %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('jd-gui') %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

jd-gui-download-only:
  file.managed:
    - name: '{{ downloads }}\jd-gui\jd-gui-{{ version }}.zip'
    - source: https://github.com/java-decompiler/jd-gui/releases/download/v{{ version }}/jd-gui-windows-{{ version }}.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
