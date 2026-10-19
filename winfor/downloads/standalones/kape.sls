# Name: kape
# Website: https://www.kroll.com/en/services/cyber-risk/incident-response-litigation-support/kroll-artifact-parser-extractor-kape
# Description: Incident Response Artifact Parser and Extractor
# Category: Windows Analysis
# Author: Eric Zimmerman / Kroll
# License: https://www.kroll.com/en/services/cyber-risk/incident-response-litigation-support/kroll-artifact-parser-extractor-kape
# Version: 1.3.0.2
# Notes: 

{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('kape') %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '1.3.0.2' %}

kape-download-only:
  file.managed:
    - name: '{{ downloads }}\kape\kape-{{ version }}.zip'
    - source: https://s3.amazonaws.com/cyb-us-prd-kape/kape.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

kape-extract-download-only:
  archive.extracted:
    - name: '{{ downloads }}\kape\'
    - source: '{{ downloads }}\kape\kape-{{ version }}.zip'
    - enforce_toplevel: False
    - require:
      - file: kape-download-only

kape-sync-download-only:
  cmd.run:
    - name: '{{ downloads }}\kape\KAPE\kape.exe --sync'
    - shell: cmd
    - require:
      - archive: kape-extract-download-only

