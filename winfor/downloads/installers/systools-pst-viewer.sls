# Name: SysTools Outlook PST Viewer
# Website: https://www.systoolsgroup.com
# Description: Outlook PST file parser
# Category: Email
# Author: SysTools
# License: https://www.systoolsgroup.com/eula.pdf
# Version: 5.0
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '5.0' %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('systools-pst-viewer') %}

outlook-pst-viewer-download-only:
  file.managed:
    - name: '{{ downloads }}\outlook-pst-viewer\outlook-pst-viewer-{{ version }}.exe'
    - source: https://downloads.systoolsgroup.com/outlook-pst-viewer.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
