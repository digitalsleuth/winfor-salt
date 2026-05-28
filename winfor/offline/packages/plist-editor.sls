# Name: Plist Editor
# Website: https://www.icopybot.com
# Description: Mac PList viewing tool
# Category: Mobile Analysis
# Author: VOW Software Studio
# License: End User License Agreement
# Version: 2.5.0
# Notes: Free Trial

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '2.5.0' %}
{% set hash = '8f0fa6fb487f559995f0846cbd375d9ce925ad328234a01dc2f526cd888c6932' %}

plist-editor-download-only:
  file.managed:
    - name: '{{ downloads }}\plist-editor\plisteditor_setup-{{ version }}.exe'
    - source: https://www.icopybot.com/plisteditor_setup.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
