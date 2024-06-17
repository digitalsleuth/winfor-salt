# Name: PST Walker
# Website: https://www.pstwalker.com/
# Description: Forensic GUI Tool for PST, OST
# Category: Email
# Author: PST Walker
# License: GNU General Public License (GPL) (https://www.pstwalker.com/licensing-policy.html)
# Version: 7.28
# Notes:

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '728' %}
{% set hash = '4243b1b3ba819700f326b760450e54173a34f2905a0f916e77927baa88491aa7' %}

pst-walker-download-only:
  file.managed:
    - name: '{{ downloads }}\pstwalker\pstwalker{{ version }}.exe'
    - source: https://downloads.pstwalker.com/pstwalker{{ version }}.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
