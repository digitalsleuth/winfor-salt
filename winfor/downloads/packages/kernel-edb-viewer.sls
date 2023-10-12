# Name: Kernel EDB Viewer
# Website: https://www.nucleustechnologies.com
# Description: Free Exchange EDB viewer
# Category: Email
# Author: Nucleus Technologies
# License: EULA (https://www.nucleustechnologies.com/eula.pdf)
# Version: 15.9
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '15.9' %}
{% set hash = '465bc1041ee2c5082f2e26a38b1b61c587423b4d2f032b5be38ce7d574ade3ed' %}

kernel-edb-viewer-download-only:
  file.managed:
    - name: '{{ downloads }}\kernel\exchange-edb-viewer-{{ version }}.exe'
    - source: https://www.nucleustechnologies.com/downloads/exchange-edb-viewer.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
