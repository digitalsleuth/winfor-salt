# Name: Sysinternals
# Website: https://sysinternals.com
# Description: Suite of Windows Analysis and Management Tools
# Category: Windows Analysis
# Author: Microsoft / Mark Russinovich
# License: https://learn.microsoft.com/en-us/sysinternals/license-terms
# Version: 2025.11.11 (date of last update - no specific version number identified)
# Notes: 

{% set version = '2025.11.11' %}
{% set hash = '1e13a617b99cbfcbd0f5e8f60de7f00a04ae82ee9d8e5721d231dc4c227d8452' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

sysinternals-download-only:
  file.managed:
    - name: '{{ downloads }}\sysinternals\SysinternalsSuite-{{ version }}.zip'
    - source: https://download.sysinternals.com/files/SysinternalsSuite.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
