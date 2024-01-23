# Name: SysTools SQL MDF Viewer
# Website: https://www.systoolsgroup.com
# Description: SQL MDF analysis tool
# Category: Databases
# Author: SysTools
# License: EULA (https://www.systoolsgroup.com/eula.html)
# Version: 12.0
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '12.0' %}
{% set hash = '1309e4856df6ce608f47ca41398a61a0e02e3fd46b9dadb029479e611fdfa32b' %}

mdf-viewer-download-only:
  file.managed:
    - name: '{{ downloads }}\systools\mdf-viewer-{{ version }}.exe'
    - source: https://downloads.systoolsgroup.com/mdf-viewer.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
