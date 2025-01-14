# Name: Passware Encryption Analyzer
# Website: https://www.passware.com
# Description: Encryption Analysis tool
# Category: Raw Parsers / Decoders
# Author: Passware - Dmitry Sumin
# License: EULA - https://www.passware.com/files/Passware-EULA.pdf
# Version: 2025.1.0.4433
# Notes:

{% set version = '2025.1.0.4433' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set hash = 'b1610cefbe3a8c9eb77e610fa15c66a61e587a773c7035743e14488c1914e687' %}

passware-encryption-analyzer-download-only:
  file.managed:
    - name: '{{ downloads }}\passware-encryption-analyzer\PasswareEncryptionAnalyzer_64bit_Setup-{{ version }}.msi'
    - source: https://demo.passware.com/files/PasswareEncryptionAnalyzer_64bit_Setup.msi
    - source_hash: sha256={{ hash }}
    - makedirs: True
