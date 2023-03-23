# Name: Passware Encryption Analyzer
# Website: https://www.passware.com
# Description: Encryption Analysis tool
# Category: Raw Parsers / Decoders
# Author: Passware - Dmitry Sumin
# License: EULA - https://www.passware.com/files/Passware-EULA.pdf
# Version: 2023.1.1.3432
# Notes:

{% set version = '2023.1.1.3432' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set hash = 'f466acb490c44290b422ea1139b43546e3b1509aa75278616cce3d5e4ff23bc2' %}

passware-encryption-analyzer-download-only:
  file.managed:
    - name: '{{ downloads }}\PasswareEncryptionAnalyzer_64bit_Setup.msi'
    - source: https://demo.passware.com/files/PasswareEncryptionAnalyzer_64bit_Setup.msi
    - source_hash: sha256={{ hash }}
    - makedirs: True
