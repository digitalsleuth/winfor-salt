# Name: Passware Encryption Analyzer
# Website: https://www.passware.com
# Description: Encryption Analysis tool
# Category: Raw Parsers / Decoders
# Author: Passware - Dmitry Sumin
# License: EULA - https://www.passware.com/files/Passware-EULA.pdf
# Version: 2024.1.0.3859
# Notes:

{% set version = '2024.1.0.3859' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set hash = '291542e8e1463317049d422abb53acde64dda144119a1d7908d736081fd087e1' %}

passware-encryption-analyzer-download-only:
  file.managed:
    - name: '{{ downloads }}\passware-encryption-analyzer\PasswareEncryptionAnalyzer_64bit_Setup-{{ version }}.msi'
    - source: https://demo.passware.com/files/PasswareEncryptionAnalyzer_64bit_Setup.msi
    - source_hash: sha256={{ hash }}
    - makedirs: True
