# Name: SysTools SQL MDF Viewer
# Website: https://www.systoolsgroup.com
# Description: SQL MDF analysis tool
# Category: Databases
# Author: SysTools
# License: EULA (https://www.systoolsgroup.com/eula.html)
# Version: 11.0
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '11.0' %}
{% set hash = 'abaefb4e37fb02e6fafb875cf73a8f8411adc71e6872af570d877d525eacde87' %}

mdf-viewer-download-only:
  file.managed:
    - name: '{{ downloads }}\mdf-viewer.exe'
    - source: https://downloads.systoolsgroup.com/mdf-viewer.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
