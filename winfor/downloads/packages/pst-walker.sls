# Name: PST Walker
# Website: https://www.pstwalker.com/
# Description: Forensic GUI Tool for PST, OST
# Category: Email
# Author: PST Walker
# License: GNU General Public License (GPL) (https://www.pstwalker.com/licensing-policy.html)
# Version: 7.31
# Notes:

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '731' %}
{% set hash = 'bfdce151bb7b152f4527c88a7b3e8baabdf73abe7cf692120aa63e4f249530ed' %}

pst-walker-download-only:
  file.managed:
    - name: '{{ downloads }}\pstwalker\pstwalker{{ version }}.exe'
    - source: https://downloads.pstwalker.com/pstwalker{{ version }}.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
