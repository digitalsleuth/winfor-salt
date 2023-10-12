# Name: PST Walker
# Website: https://www.pstwalker.com/
# Description: Forensic GUI Tool for PST, OST
# Category: Email
# Author: PST Walker
# License: GNU General Public License (GPL) (https://www.pstwalker.com/licensing-policy.html)
# Version: 7.19
# Notes:

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '719' %}
{% set hash = '9b3d3db3bb9c0cef07c100bc6d14ede19a27cb349c01793fb7aa6f6d3942bcdf' %}

pst-walker-download-only:
  file.managed:
    - name: '{{ downloads }}\pstwalker\pstwalker{{ version }}.exe'
    - source: https://downloads.pstwalker.com/pstwalker{{ version }}.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
