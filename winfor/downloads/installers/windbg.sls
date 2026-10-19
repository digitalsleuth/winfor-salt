# Name: WinDbg
# Website: https://www.microsoft.com
# Description: Windows Debugger
# Category: Executables
# Author: Microsoft
# License: Third-party Notices within app
# Version: 1.2603.20001.0
# Notes: 

{% set version = '1.2603.20001.0' %}
{% set dashes = version | replace(".","-") %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('windbg') %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

windbg-download-only:
  file.managed:
    - name: '{{ downloads }}\windbg\windbg-{{ version }}.msixbundle'
    - source: https://windbg.download.prss.microsoft.com/dbazure/prod/{{ dashes }}/windbg.msixbundle
    - source_hash: sha256={{ hash }}
    - makedirs: True
