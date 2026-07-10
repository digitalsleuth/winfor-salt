# Name: Event Log Explorer
# Website: https://eventlogxp.com/
# Description: Windows Event Log Parser
# Category: Windows Analysis
# Author: FSPro
# License: Multiple (https://eventlogxp.com/order.html)
# Version: 5.8.2
# Notes:

{% set version = '5.8.2' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'eventlog-explorer-'~ version ~'.exe' %}
{% set exists = salt['file.file_exists'](downloads + '\\eventlog-explorer\\' + pkg) %}

{% if exists %}
eventlog-explorer-install-offline:
  cmd.run:
    - name: '{{ pkg }} /SP- /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /MERGETASKS=!DESKTOPICON,!RUNCODE'
    - shell: cmd
    - cwd: '{{ downloads }}\eventlog-explorer\'

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
