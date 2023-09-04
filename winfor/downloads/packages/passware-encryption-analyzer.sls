# Name: Passware Encryption Analyzer
# Website: https://www.passware.com
# Description: Encryption Analysis tool
# Category: Raw Parsers / Decoders
# Author: Passware - Dmitry Sumin
# License: EULA - https://www.passware.com/files/Passware-EULA.pdf
# Version: 2023.3.1.3695
# Notes:

{% set version = '2023.3.1.3695' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set hash = '97b262c8b65675d4bd4621b42934e7e103389ab49057061acee1511f05f2174e' %}

passware-encryption-analyzer-download-only:
  file.managed:
    - name: '{{ downloads }}\PasswareEncryptionAnalyzer_64bit_Setup.msi'
    - source: https://demo.passware.com/files/PasswareEncryptionAnalyzer_64bit_Setup.msi
    - source_hash: sha256={{ hash }}
    - makedirs: True
