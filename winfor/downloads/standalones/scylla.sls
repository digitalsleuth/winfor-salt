# Name: Scylla
# Website: https://github.com/ntquery/scylla
# Description: Imports Reconstructor written in C/C++
# Category: Executables
# Author: NtQuery
# License: GNU General Public License v3 (https://github.com/NtQuery/Scylla/blob/master/LICENSE)
# Version: 0.9.8
# Notes: May not work well on later versions of Windows 10 and any version of Windows 11

{% set version = '0.9.8' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('scylla') %}

scylla-download-only:
  file.managed:
    - name: '{{ downloads }}\scylla\scylla-{{ version }}.rar'
    - source: https://github.com/NtQuery/Scylla/releases/download/v{{ version }}/Scylla_v{{ version }}.rar
    - source_hash: sha256={{ hash }}
    - makedirs: True
