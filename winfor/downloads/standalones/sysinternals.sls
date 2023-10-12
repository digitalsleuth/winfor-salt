# Name: Sysinternals
# Website: https://sysinternals.com
# Description: Suite of Windows Analysis and Management Tools
# Category: Windows Analysis
# Author: Microsoft / Mark Russinovich
# License: https://learn.microsoft.com/en-us/sysinternals/license-terms
# Version: 2023.09.29 (date of last update - no specific version number identified)
# Notes: 

{% set hash = 'bd19e61ee6eff23f7e6add39c1ffe2a338914e8022811d8c80571d7291ae1ea4' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '2023.09.29' %}

sysinternals-download-only:
  file.managed:
    - name: '{{ downloads }}\sysinternals\SysinternalsSuite-{{ version }}.zip'
    - source: https://download.sysinternals.com/files/SysinternalsSuite.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
