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
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('plist-editor') %}

plist-editor-download-only:
  file.managed:
    - name: '{{ downloads }}\plist-editor\plist-editor-{{ version }}.exe'
    - source: https://www.icopybot.com/plisteditor_setup.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
