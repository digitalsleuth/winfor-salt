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

snmp-tester-download:
  file.managed:
    - name: 'C:\salt\tempdownload\snmp-tester-{{ version }}.zip'
    - source: https://downloads.paessler.com/tools/snmp-tester/Paessler%20SNMP%20Tester.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

snmp-tester-extract:
  archive.extracted:
    - name: 'C:\salt\tempdownload'
    - source: 'C:\salt\tempdownload\snmp-tester-{{ version }}.zip'
    - enforce_toplevel: False
    - require:
      - file: snmp-tester-download

snmp-tester-install:
  cmd.run:
    - name: '"Paessler SNMP Tester Setup.exe" /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /MERGETASKS=!DESKTOPICON,!RUNCODE'
    - shell: cmd
    - cwd: 'C:\salt\tempdownload'
    - require:
      - archive: snmp-tester-extract

snmp-tester-cleanup:
  file.absent:
    - names:
      - 'C:\salt\tempdownload\Paessler SNMP Tester Setup.exe'
      - 'C:\salt\tempdownload\snmp-tester-{{ version }}.zip'
    - require:
      - cmd: snmp-tester-install
