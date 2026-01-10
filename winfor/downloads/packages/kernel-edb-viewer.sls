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
{% set hash = 'f09e131efe586754ba41550179c793be39a0efecf697a14d875abd9685d2f8e8' %}

kernel-edb-viewer-download-only:
  file.managed:
    - name: '{{ downloads }}\kernel\exchange-edb-viewer-{{ version }}.exe'
    - source: https://www.nucleustechnologies.com/downloads/exchange-edb-viewer.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
