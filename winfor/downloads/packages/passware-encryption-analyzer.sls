# Name: Passware Encryption Analyzer
# Website: https://www.passware.com
# Description: Encryption Analysis tool
# Category: Raw Parsers / Decoders
# Author: Passware - Dmitry Sumin
# License: EULA - https://www.passware.com/files/Passware-EULA.pdf
# Version: 2023.3.0.3644
# Notes:

{% set version = '2023.3.0.3644' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set hash = '7368006607c98b386e9da3dc13349e4a2c8c6a8b0496d807469b77b3b5914e53' %}

passware-encryption-analyzer-download-only:
  file.managed:
    - name: '{{ downloads }}\PasswareEncryptionAnalyzer_64bit_Setup.msi'
    - source: https://demo.passware.com/files/PasswareEncryptionAnalyzer_64bit_Setup.msi
    - source_hash: sha256={{ hash }}
    - makedirs: True
