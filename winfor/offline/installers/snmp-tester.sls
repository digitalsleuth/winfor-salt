# Name: Paessler SNMP Tester
# Website: https://paessler.com
# Description: SNMP testing and debugging tool
# Category: Network
# Author: Paessler GmbH
# License: Multiple (https://www.paessler.com/manuals/prtg/legal_notices)
# Version: 24.4.102.648
# Notes:

{% set version = '24.4.102.648' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'snmp-tester-' ~ version ~ '.zip' %}
{% set exists = salt['file.file_exists'](downloads + '\\snmp-tester\\' + pkg) %}

{% if exists %}

snmp-tester-extract-offline:
  archive.extracted:
    - name: '{{ downloads }}\snmp-tester'
    - source: '{{ downloads }}\snmp-tester\snmp-tester-{{ version }}.zip'
    - enforce_toplevel: False

snmp-tester-install-offline:
  cmd.run:
    - name: '"Paessler SNMP Tester Setup.exe" /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /MERGETASKS=!DESKTOPICON,!RUNCODE'
    - shell: cmd
    - cwd: '{{ downloads }}\snmp-tester'
    - require:
      - archive: snmp-tester-extract-offline

snmp-tester-cleanup:
  file.absent:
    - name: '{{ downloads }}\snmp-tester\Paessler SNMP Tester Setup.exe'
    - require:
      - cmd: snmp-tester-install-offline

{% else %}

{{ pkg }} does not exist:
  module.run:
    - name: log.warning
    - message: "{{ pkg }} does not exist"

{% endif %}
