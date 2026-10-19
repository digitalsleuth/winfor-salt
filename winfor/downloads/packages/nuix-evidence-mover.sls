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
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('nuix-evidence-mover') %}

nuix-evidence-mover-download-only:
  file.managed:
    - name: '{{ downloads }}\nuix\nuix-evidence-mover-{{ version }}.msi'
    - source: https://github.com/digitalsleuth/salt-winrepo-ng/raw/main/files/nuix_evidence_mover_{{ version }}.msi
    - source_hash: sha256={{ hash }}
    - makedirs: True
