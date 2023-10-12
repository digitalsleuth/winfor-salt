# Name: Nuix Evidence Mover
# Website: https://www.nuix.com/nuix-evidence-mover
# Description: File Transfer tool with source and destination hashing
# Category: Utilities
# Author: NUIX
# License: https://www.oracle.com/legal/terms.html
# Version: 6.2.1
# Notes:

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '6.2.1' %}
{% set hash = 'cb29d30a5d3db6373baacfbb5d6c8998f6cb50a8e6647c892f179266f4bdb615' %}

nuix-evidence-mover-download-only:
  file.managed:
    - name: '{{ downloads }}\nuix\nuix_evidence_mover_{{ version }}.msi'
    - source: https://github.com/digitalsleuth/salt-winrepo-ng/raw/main/files/nuix_evidence_mover_{{ version }}.msi
    - source_hash: sha256={{ hash }}
    - makedirs: True
