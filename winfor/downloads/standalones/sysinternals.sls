# Name: Sysinternals
# Website: https://sysinternals.com
# Description: Suite of Windows Analysis and Management Tools
# Category: Windows Analysis
# Author: Microsoft / Mark Russinovich
# License: https://learn.microsoft.com/en-us/sysinternals/license-terms
# Version: 2025.11.11 (date of last update - no specific version number identified)
# Notes: 

{% set version = '2025.11.11' %}
{% set hash = 'ba441238eb68b33aa7b9abf141ee9bc5393dfce2e174135095b898840b0b6c58' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

sysinternals-download-only:
  file.managed:
    - name: '{{ downloads }}\sysinternals\SysinternalsSuite-{{ version }}.zip'
    - source: https://download.sysinternals.com/files/SysinternalsSuite.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
