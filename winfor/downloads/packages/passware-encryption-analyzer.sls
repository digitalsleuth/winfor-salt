# Name: Passware Encryption Analyzer
# Website: https://www.passware.com
# Description: Encryption Analysis tool
# Category: Raw Parsers / Decoders
# Author: Passware - Dmitry Sumin
# License: EULA - https://www.passware.com/files/Passware-EULA.pdf
# Version: 2026.1.0.4992
# Notes:

{% set version = '2026.1.0.4992' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set hash = 'd18833ed92b5be1fcb8b44657fa044977ccdcc3995adde0d5dfb08cd540c0509' %}

passware-encryption-analyzer-download-only:
  file.managed:
    - name: '{{ downloads }}\passware-encryption-analyzer\PasswareEncryptionAnalyzer_64bit_Setup-{{ version }}.msi'
    - source: https://demo.passware.com/files/PasswareEncryptionAnalyzer_64bit_Setup.msi
    - source_hash: sha256={{ hash }}
    - makedirs: True
