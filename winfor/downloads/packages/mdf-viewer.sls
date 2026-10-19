# Name: SysTools SQL MDF Viewer
# Website: https://www.systoolsgroup.com
# Description: SQL MDF analysis tool
# Category: Databases
# Author: SysTools
# License: EULA (https://www.systoolsgroup.com/eula.html)
# Version: 13.0
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '13.0' %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('mdf-viewer') %}

mdf-viewer-download-only:
  file.managed:
    - name: '{{ downloads }}\systools\mdf-viewer-{{ version }}.exe'
    - source: https://downloads.systoolsgroup.com/mdf-viewer.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
