# Name: Kernel for Exchange Server
# Website: https://www.nucleustechnologies.com
# Description: Free Exchange EDB viewer
# Category: Email
# Author: Nucleus Technologies
# License: EULA (https://www.nucleustechnologies.com/eula.pdf)
# Version: 23.2
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '23.2' %}
{% set hash = '2148a11019de7744e60fda025c6f9549665b9ece5e6b5eaa47f4021161bb8cb8' %}

kernel-edb-viewer-download-only:
  file.managed:
    - name: '{{ downloads }}\kernel\exchange-edb-viewer-{{ version }}.exe'
    - source: https://www.nucleustechnologies.com/downloads/exchange-edb-viewer.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
