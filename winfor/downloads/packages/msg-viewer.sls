# Name: MSG Viewer
# Website: https://www.pstwalker.com/
# Description: Forensic GUI Tool for MSG, EML
# Category: Email
# Author: PST Walker
# License: GNU General Public License (GPL) (https://www.pstwalker.com/licensing-policy.html)
# Version: 4.29
# Notes:

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '429' %}
{% set hash = 'b2ba2acf08eba4e8fa9cc1eb82bb4fda326255c5c8527c717a742bbefa231885' %}

msg-viewer-download-only:
  file.managed:
    - name: '{{ downloads }}\pstwalker\msgviewer{{ version }}.exe'
    - source: https://downloads.pstwalker.com/msgviewer{{ version }}.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
