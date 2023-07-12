# Name: WinDbg
# Website: https://www.microsoft.com
# Description: Windows Debugger
# Category: Executables
# Author: Microsoft
# License: Third-party Notices within app
# Version: 1.2306.12001.0
# Notes: 

{% set version = '1.2306.12001.0' %}
{% set hash = '0a3615caa8a32cd0bc4977ac0be7896af071a473182b9f786b2360b11332b07f' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

windbg-download-only:
  file.managed:
    - name: '{{ downloads }}\windbg-{{ version }}.appinstaller'
    - source: https://windbg.download.prss.microsoft.com/dbazure/prod/1-0-0/windbg.appinstaller
    - source_hash: sha256={{ hash }}
    - makedirs: True
