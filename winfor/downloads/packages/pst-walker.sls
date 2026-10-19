# Name: PST Walker
# Website: https://www.pstwalker.com/
# Description: Forensic GUI Tool for PST, OST
# Category: Email
# Author: PST Walker
# License: GNU General Public License (GPL) (https://www.pstwalker.com/licensing-policy.html)
# Version: 7.31
# Notes:

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '7.31' %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('pst-walker') %}

pst-walker-download-only:
  file.managed:
    - name: '{{ downloads }}\pst-walker\pst-walker-{{ version }}.exe'
    - source: https://downloads.pstwalker.com/pstwalker{{ version | replace(".","") }}.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
