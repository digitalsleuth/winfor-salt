# Name: Paessler SNMP Tester
# Website: https://paessler.com
# Description: SNMP testing and debugging tool
# Category: Network
# Author: Paessler GmbH
# License: Multiple (https://www.paessler.com/manuals/prtg/legal_notices)
# Version: 24.4.102.648
# Notes:

{% set version = '24.4.102.648' %}
{% set hash = 'd616408a0c82a88c760731e4c72c6f44759ca532a070adff37a000aa279c249a' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

snmp-tester-download-only:
  file.managed:
    - name: '{{ downloads }}\snmp-tester\snmp-tester-{{ version }}.zip'
    - source: https://downloads.paessler.com/tools/snmp-tester/Paessler%20SNMP%20Tester.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
