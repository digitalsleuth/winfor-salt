# Name: Sysinternals
# Website: https://sysinternals.com
# Description: Suite of Windows Analysis and Management Tools
# Category: Windows Analysis
# Author: Microsoft / Mark Russinovich
# License: https://learn.microsoft.com/en-us/sysinternals/license-terms
# Version: 2024.02.08 (date of last update - no specific version number identified)
# Notes: 

{% set version = '2024.02.08' %}
{% set hash = 'c9a3b8aaeb55b8538d3d15991e4f430225c35b50a653184e325ae72ecd1c3860' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

sysinternals-download-only:
  file.managed:
    - name: '{{ downloads }}\sysinternals\SysinternalsSuite-{{ version }}.zip'
    - source: https://download.sysinternals.com/files/SysinternalsSuite.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
