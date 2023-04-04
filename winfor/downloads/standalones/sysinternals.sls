# Name: Sysinternals
# Website: https://sysinternals.com
# Description: Suite of Windows Analysis and Management Tools
# Category: Windows Analysis
# Author: Microsoft / Mark Russinovich
# License: https://learn.microsoft.com/en-us/sysinternals/license-terms
# Version: 2023.04.03 (date of last update - no specific version number identified)
# Notes: 

{% set hash = 'e144e93d83c7ea792e1e9e804253b8eda9649ee1102dc168c7bd70ac26edb199' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

sysinternals-download-only:
  file.managed:
    - name: '{{ downloads }}\SysinternalsSuite.zip'
    - source: https://download.sysinternals.com/files/SysinternalsSuite.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
