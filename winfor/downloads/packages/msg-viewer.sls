# Name: MSG Viewer
# Website: https://www.pstwalker.com/
# Description: Forensic GUI Tool for MSG, EML
# Category: Email
# Author: PST Walker
# License: GNU General Public License (GPL) (https://www.pstwalker.com/licensing-policy.html)
# Version: 4.32
# Notes:

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '432' %}
{% set hash = '0eef7fa0f383d7d8aa2e3e8f82267e1dd2a22cd5d9e8162e179c70b4bcbf2d87' %}

msg-viewer-download-only:
  file.managed:
    - name: '{{ downloads }}\pstwalker\msgviewer{{ version }}.exe'
    - source: https://downloads.pstwalker.com/msgviewer{{ version }}.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
