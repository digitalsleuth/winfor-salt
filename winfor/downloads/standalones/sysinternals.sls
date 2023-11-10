# Name: Sysinternals
# Website: https://sysinternals.com
# Description: Suite of Windows Analysis and Management Tools
# Category: Windows Analysis
# Author: Microsoft / Mark Russinovich
# License: https://learn.microsoft.com/en-us/sysinternals/license-terms
# Version: 2023.11.09 (date of last update - no specific version number identified)
# Notes: 

{% set hash = 'd833ecf3030b3b524dfde550c9c27369604a4117292baaa636d0f3417ae0d817' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '2023.11.09' %}

sysinternals-download-only:
  file.managed:
    - name: '{{ downloads }}\sysinternals\SysinternalsSuite-{{ version }}.zip'
    - source: https://download.sysinternals.com/files/SysinternalsSuite.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
