# Name: Sysinternals
# Website: https://sysinternals.com
# Description: Suite of Windows Analysis and Management Tools
# Category: Windows Analysis
# Author: Microsoft / Mark Russinovich
# License: https://learn.microsoft.com/en-us/sysinternals/license-terms
# Version: 2024.02.06 (date of last update - no specific version number identified)
# Notes: 

{% set version = '2024.02.06' %}
{% set hash = '2cdc9e1aa319edb908e04432835cf51050e23fc0b330f78e25b8588afd6cebea' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

sysinternals-download-only:
  file.managed:
    - name: '{{ downloads }}\sysinternals\SysinternalsSuite-{{ version }}.zip'
    - source: https://download.sysinternals.com/files/SysinternalsSuite.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
