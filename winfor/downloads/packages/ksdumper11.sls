# Name: KsDumper 11
# Website: https://github.com/mastercodeon314/KsDumper-11
# Description: Kernel Space Dumper utility
# Category: Executables
# Author: mastercodeon314
# License: None at this time
# Version: 1.0
# Notes:

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '1.0' %}
{% set hash = '99319f08a373956d51caa80e1b8f25aaac1fa55dbcb38c84c1fc28602960b810' %}
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
    - source: https://github.com/mastercodeon314/KsDumper-11/releases/download/{{ version }}/KsDumper11.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
    - require:
      - cmd: ksdumper11-defender-exclusion-download-only
