# Name: MSG Viewer
# Website: https://www.pstwalker.com/
# Description: Forensic GUI Tool for MSG, EML
# Category: Email
# Author: PST Walker
# License: GNU General Public License (GPL) (https://www.pstwalker.com/licensing-policy.html)
# Version: 4.22
# Notes:

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '422' %}
{% set hash = '95a19d28fa4eb34ed8affbff3335aa7b45ca33cc3ceae47c48c11f0e41ffaa19' %}

msg-viewer-download-only:
  file.managed:
    - name: '{{ downloads }}\pstwalker\msgviewer{{ version }}.exe'
    - source: https://downloads.pstwalker.com/msgviewer{{ version }}.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
