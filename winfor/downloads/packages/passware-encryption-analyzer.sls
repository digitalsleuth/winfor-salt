# Name: Passware Encryption Analyzer
# Website: https://www.passware.com
# Description: Encryption Analysis tool
# Category: Raw Parsers / Decoders
# Author: Passware - Dmitry Sumin
# License: EULA - https://www.passware.com/files/Passware-EULA.pdf
# Version: 2024.4.0.4328
# Notes:

{% set version = '2024.4.0.4328' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set hash = '7c57a9d22713f1424d9191b8528479a2a911f56cb0ff4a5ea49b02ebf589d450' %}

passware-encryption-analyzer-download-only:
  file.managed:
    - name: '{{ downloads }}\passware-encryption-analyzer\PasswareEncryptionAnalyzer_64bit_Setup-{{ version }}.msi'
    - source: https://demo.passware.com/files/PasswareEncryptionAnalyzer_64bit_Setup.msi
    - source_hash: sha256={{ hash }}
    - makedirs: True
