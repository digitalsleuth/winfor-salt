# Name: Live Response Collection (Cedarpelta)
# Website: https://www.brimorlabs.com/tools/
# Description: Incident Response Artifact Parser and Extractor
# Category: Windows Analysis
# Author: Brian Moran
# License: GNU General Public License v3.0 (see COPYING in zip file)
# Version: Cedarpelta - 20190905
# Notes: Also does macOS and Linux collection

{% set hash = '2c32984adf2b5b584761f61bd58b61dfc0c62b27b117be40617fa260596d9c63' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '20190905' %}

lrc-cedarpelta-download-only:
  file.managed:
    - name: '{{ downloads }}\lrc-cedarpelta\LiveResponseCollection-Cedarpelta-{{ version }}.zip'
    - source: https://www.brimorlabs.com/Tools/LiveResponseCollection-Cedarpelta.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
