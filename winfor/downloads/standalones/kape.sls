# Name: kape
# Website: https://www.kroll.com/en/services/cyber-risk/incident-response-litigation-support/kroll-artifact-parser-extractor-kape
# Description: Incident Response Artifact Parser and Extractor
# Category: Windows Analysis
# Author: Eric Zimmerman / Kroll
# License: https://www.kroll.com/en/services/cyber-risk/incident-response-litigation-support/kroll-artifact-parser-extractor-kape
# Version: 1.3.0.2
# Notes: 

{% set hash = '601395b86ea4472ae01a0041ad3470dea5ba7e4accfcd652229ed51604aed2ca' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '1.3.0.2' %}

kape-download-only:
  file.managed:
    - name: '{{ downloads }}\kape\kape-{{ version }}.zip'
    - source: https://s3.amazonaws.com/cyb-us-prd-kape/kape.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
