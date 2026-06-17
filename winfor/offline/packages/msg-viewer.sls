# Name: MSG Viewer
# Website: https://www.pstwalker.com/
# Description: Forensic GUI Tool for MSG, EML
# Category: Email
# Author: PST Walker
# License: GNU General Public License (GPL) (https://www.pstwalker.com/licensing-policy.html)
# Version: 4.24
# Notes:

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '424' %}
{% set hash = '3ebbe5ff4ff29408972a9e47a0e2de4a68ac1cd05bf9acdc9822bf627dc8c785' %}

msg-viewer-download-only:
  file.managed:
    - name: '{{ downloads }}\pstwalker\msgviewer{{ version }}.exe'
    - source: https://downloads.pstwalker.com/msgviewer{{ version }}.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
