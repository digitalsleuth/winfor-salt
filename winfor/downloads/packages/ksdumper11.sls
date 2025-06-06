# Name: KsDumper 11
# Website: https://github.com/mastercodeon314/KsDumper-11
# Description: Kernel Space Dumper utility
# Category: Executables
# Author: mastercodeon314
# License: None at this time
# Version: 1.3.4
# Notes:

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '1.3.4' %}
{% set hash = '3d9c302a6cbcdc165b2bd6be776886b20a402c409f653ad3ee4ad4ccd6079c14' %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set defender_status = salt['cmd.run']('powershell -c "(Get-Service windefend).Status"') %}

ksdumper11-defender-exclusion-download-only:
  cmd.run:
{% if defender_status == "Running" %}
    - names:
      - 'echo "Defender is {{ defender_status }}"'
      - 'Add-MpPreference -ExclusionPath "{{ downloads }}"'
      - 'Add-MpPreference -ExclusionPath "{{ PROGRAMDATA }}\Salt Project\Salt\var"'
{% else %}
    - name:
      - 'echo "Defender is {{ defender_status }}"'
{% endif %}
    - shell: powershell

ksdumper11-download-only:
  file.managed:
    - name: '{{ downloads }}\ksdumper\KsDumper11-{{ version }}.zip'
    - source: https://github.com/mastercodeon314/KsDumper-11/releases/download/{{ version }}/KsDumper11.v{{ version }}.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
    - require:
      - cmd: ksdumper11-defender-exclusion-download-only
