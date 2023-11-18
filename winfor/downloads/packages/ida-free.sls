# Name: IDA Free
# Website: https://hex-rays.com/ida-free
# Description: Binary analysis tool for x86/x64 applications
# Category: Executables
# Author: hex-rays
# License: Free for Educational, Personal, and non-Commercial use
# Version: 8.3
# Notes:

{% set version = '8.3' %}
{% set hash = '10080a057704630578e697c6bb0b09968a54138075cacab175f62d60c71d0a1f' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

ida-free-download-only:
  file.managed:
    - name: '{{ downloads }}\ida-free\idafree{{ version|replace(".","") }}_windows.exe'
    - source: https://out7.hex-rays.com/files/idafree{{ version|replace(".","") }}_windows.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
