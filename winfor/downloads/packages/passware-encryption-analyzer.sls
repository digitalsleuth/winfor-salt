# Name: Passware Encryption Analyzer
# Website: https://www.passware.com
# Description: Encryption Analysis tool
# Category: Raw Parsers / Decoders
# Author: Passware - Dmitry Sumin
# License: EULA - https://www.passware.com/files/Passware-EULA.pdf
# Version: 2023.2.1.3577
# Notes:

{% set version = '2023.2.1.3577' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set hash = 'db0c322e487b6d79098f761d6e7041a294d1a97aaab973b98e42fcc9985d23c1' %}

passware-encryption-analyzer-download-only:
  file.managed:
    - name: '{{ downloads }}\PasswareEncryptionAnalyzer_64bit_Setup.msi'
    - source: https://demo.passware.com/files/PasswareEncryptionAnalyzer_64bit_Setup.msi
    - source_hash: sha256={{ hash }}
    - makedirs: True
