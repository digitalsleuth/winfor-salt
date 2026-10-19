# Name: MSG Viewer
# Website: https://www.pstwalker.com/
# Description: Forensic GUI Tool for MSG, EML
# Category: Email
# Author: PST Walker
# License: GNU General Public License (GPL) (https://www.pstwalker.com/licensing-policy.html)
# Version: 4.35
# Notes:

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '435' %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('msg-viewer') %}

msg-viewer-download-only:
  file.managed:
    - name: '{{ downloads }}\msg-viewer\msg-viewer-{{ version }}.exe'
    - source: https://downloads.pstwalker.com/msgviewer{{ version }}.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
