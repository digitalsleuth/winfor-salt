# Name: Passware Encryption Analyzer
# Website: https://www.passware.com
# Description: Encryption Analysis tool
# Category: Raw Parsers / Decoders
# Author: Passware - Dmitry Sumin
# License: EULA - https://www.passware.com/files/Passware-EULA.pdf
# Version: 2023.2.0.3511
# Notes:

{% set version = '2023.2.0.3511' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set hash = '9244380bdeb62b7a3d07323eed504554983a0a957a73c801feb702738e95cbe3' %}

passware-encryption-analyzer-download-only:
  file.managed:
    - name: '{{ downloads }}\PasswareEncryptionAnalyzer_64bit_Setup.msi'
    - source: https://demo.passware.com/files/PasswareEncryptionAnalyzer_64bit_Setup.msi
    - source_hash: sha256={{ hash }}
    - makedirs: True
