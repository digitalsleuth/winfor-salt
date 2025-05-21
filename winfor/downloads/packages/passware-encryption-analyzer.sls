# Name: Passware Encryption Analyzer
# Website: https://www.passware.com
# Description: Encryption Analysis tool
# Category: Raw Parsers / Decoders
# Author: Passware - Dmitry Sumin
# License: EULA - https://www.passware.com/files/Passware-EULA.pdf
# Version: 2025.2.1.4623
# Notes:

{% set version = '2025.2.1.4623' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set hash = 'e555d2e3c1714735aae4618b79957b70e864bbc37147637867e7b03174502767' %}

passware-encryption-analyzer-download-only:
  file.managed:
    - name: '{{ downloads }}\passware-encryption-analyzer\PasswareEncryptionAnalyzer_64bit_Setup-{{ version }}.msi'
    - source: https://demo.passware.com/files/PasswareEncryptionAnalyzer_64bit_Setup.msi
    - source_hash: sha256={{ hash }}
    - makedirs: True
