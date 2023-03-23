# Name: PST Walker
# Website: https://www.pstwalker.com/
# Description: Forensic GUI Tool for PST, OST
# Category: Email
# Author: PST Walker
# License: GNU General Public License (GPL) (https://www.pstwalker.com/licensing-policy.html)
# Version: 7.06
# Notes:

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '706' %}
{% set hash = '9bf8df53113c858ea9b8a4abf9ffa92350244fb62fae3f56ceaaae5d41d4e478' %}

pst-walker-download-only:
  file.managed:
    - name: '{{ downloads }}\pstwalker{{ version }}.exe'
    - source: https://downloads.pstwalker.com/pstwalker{{ version }}.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
