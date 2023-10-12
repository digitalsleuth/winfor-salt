# Name: WinDbg
# Website: https://www.microsoft.com
# Description: Windows Debugger
# Category: Executables
# Author: Microsoft
# License: Third-party Notices within app
# Version: 1.2308.2002.0
# Notes: 

{% set version = '1.2308.2002.0' %}
{% set hash = '25195d02c40a3496053fec728de833275559534e30b18fa206e5182ca0dd78e8' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

windbg-download-only:
  file.managed:
    - name: '{{ downloads }}\windbg\windbg-{{ version }}.appinstaller'
    - source: https://windbg.download.prss.microsoft.com/dbazure/prod/1-0-0/windbg.appinstaller
    - source_hash: sha256={{ hash }}
    - makedirs: True
