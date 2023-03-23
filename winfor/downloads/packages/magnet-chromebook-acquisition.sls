# Name: Magnet Chromebook Acquisition
# Website: https://www.magnetforensics.com
# Description: Evidence Acquisition for Chromebook
# Category: Acquisition and Analysis
# Author: Jad Saliba - Magnet Forensics
# License: EULA
# Version: 1.06
# Notes:

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '1.06' %}
{% set hash = '9beb3829430836f50ebcdae9fd4f13ae51a41d7900f5e60263960c49a32c11b1' %}

magnet-chromebook-acquisition:
  file.managed:
    - name: '{{ downloads }}\MCAA_Setup_v106.exe'
    - source: https://github.com/digitalsleuth/salt-winrepo-ng/raw/main/files/MCAA_Setup_v106.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
