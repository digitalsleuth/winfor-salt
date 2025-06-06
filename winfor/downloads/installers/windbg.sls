# Name: WinDbg
# Website: https://www.microsoft.com
# Description: Windows Debugger
# Category: Executables
# Author: Microsoft
# License: Third-party Notices within app
# Version: 1.2502.25002.0
# Notes: 

{% set version = '1.2502.25002.0' %}
{% set dashes = version | replace(".","-") %}
{% set hash = '2802c9da1eccdfd488d1364aa601170d44dc37e2c8354be514f5f5a40c9cfcda' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

windbg-download-only:
  file.managed:
    - name: '{{ downloads }}\windbg\windbg-{{ version }}.msixbundle'
    - source: https://windbg.download.prss.microsoft.com/dbazure/prod/{{ dashes }}/windbg.msixbundle
    - source_hash: sha256={{ hash }}
    - makedirs: True
