# Name: PST Walker
# Website: https://www.pstwalker.com/
# Description: Forensic GUI Tool for PST, OST
# Category: Email
# Author: PST Walker
# License: GNU General Public License (GPL) (https://www.pstwalker.com/licensing-policy.html)
# Version: 7.24
# Notes:

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '724' %}
{% set hash = '8db87adc7c63c0c0e68883106598bb687ba14dd57476e8b55f4bc608765c0729' %}

pst-walker-download-only:
  file.managed:
    - name: '{{ downloads }}\pstwalker\pstwalker{{ version }}.exe'
    - source: https://downloads.pstwalker.com/pstwalker{{ version }}.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
