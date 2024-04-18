# Name: WinDbg
# Website: https://www.microsoft.com
# Description: Windows Debugger
# Category: Executables
# Author: Microsoft
# License: Third-party Notices within app
# Version: 1.2402.24001.0
# Notes: 

{% set version = '1.2402.24001.0' %}
{% set hash = '9c28769af133e803a0eadeb5e4aea11175565b7683158d4eb0eae09e045d2366' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

windbg-download-only:
  file.managed:
    - name: '{{ downloads }}\windbg\windbg-{{ version }}.appinstaller'
    - source: https://windbg.download.prss.microsoft.com/dbazure/prod/1-0-0/windbg.appinstaller
    - source_hash: sha256={{ hash }}
    - makedirs: True
