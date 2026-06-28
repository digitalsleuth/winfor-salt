# Name: Plist Editor
# Website: https://www.icopybot.com
# Description: Mac PList viewing tool
# Category: Mobile Analysis
# Author: VOW Software Studio
# License: End User License Agreement
# Version: 2.5.0
# Notes: Free Trial

{% set version = '2.5.0' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'plist-editor-'~ version ~'.exe' %}
{% set exists = salt['file.file_exists'](downloads + '\\plist-editor\\' + pkg) %}

{% if exists %}
plist-editor-install-offline:
  cmd.run:
    - name: '{{ pkg }} /S'
    - shell: cmd
    - cwd: '{{ downloads }}\plist-editor\'

plist-editor-icon-remove-offline:
  file.absent:
    - name: 'C:\Users\Public\Desktop\plist Editor Pro.lnk'
    - require:
      - cmd: plist-editor-install-offline

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
