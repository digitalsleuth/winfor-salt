# Name: MSG Viewer
# Website: https://www.pstwalker.com/
# Description: Forensic GUI Tool for MSG, EML
# Category: Email
# Author: PST Walker
# License: GNU General Public License (GPL) (https://www.pstwalker.com/licensing-policy.html)
# Version: 4.26
# Notes:

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '426' %}
{% set hash = '379559f231349fe02aaedd78c2014aaae123a398cdabb78304f547e8522b5f4b' %}

msg-viewer-download-only:
  file.managed:
    - name: '{{ downloads }}\pstwalker\msgviewer{{ version }}.exe'
    - source: https://downloads.pstwalker.com/msgviewer{{ version }}.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
