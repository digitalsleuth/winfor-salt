# Name: kape
# Website: https://www.kroll.com/en/services/cyber-risk/incident-response-litigation-support/kroll-artifact-parser-extractor-kape
# Description: Incident Response Artifact Parser and Extractor
# Category: Windows Analysis
# Author: Eric Zimmerman / Kroll
# License: https://www.kroll.com/en/services/cyber-risk/incident-response-litigation-support/kroll-artifact-parser-extractor-kape
# Version: 1.3.0.2
# Notes: 

{% set hash = '0412db20683b6da5016ae768c2d741a07a52eeeaed291df4ebcc52c2832945f7' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

kape-download-only:
  file.managed:
    - name: '{{ downloads }}\kape.zip'
    - source: https://s3.amazonaws.com/cyb-us-prd-kape/kape.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
