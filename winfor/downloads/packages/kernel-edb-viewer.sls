# Name: Kernel for Exchange Server
# Website: https://www.nucleustechnologies.com
# Description: Free Exchange EDB viewer
# Category: Email
# Author: Nucleus Technologies
# License: EULA (https://www.nucleustechnologies.com/eula.pdf)
# Version: 25.0
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '25.0' %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('kernel-edb-viewer') %}

kernel-edb-viewer-download-only:
  file.managed:
    - name: '{{ downloads }}\kernel\kernel-edb-viewer-{{ version }}.exe'
    - source: https://www.nucleustechnologies.com/downloads/exchange-edb-viewer.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
