# Name: WSL 2 System Update
# Website: https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi
# Description: Update for Windows Subsystem for Linux to version 2
# Category: Requirements
# Author: Microsoft
# License: EULA
# Version: 5.10.16
# Notes: 

{% set version = '5.10.16' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set hash = '4d09c776c8d45f70a202281d18e19be1118f53159b0c217a5274a31ce18525fe' %}

wsl2-update-download-only:
  file.managed:
    - name: '{{ downloads }}\wsl\wsl-update.msi'
    - source: https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi
    - source_hash: sha256={{ hash }}
    - makedirs: True
