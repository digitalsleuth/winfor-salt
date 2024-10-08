# Name: Mimikatz
# Website: https://github.com/gentilkiwi/mimikatz
# Description: Windows-based hash extraction tool
# Category: Windows Analysis
# Author: Benjamin Delpy
# License: Creative Commons BY 4.0
# Version: 2.2.0-20220919
# Notes: Detects as a virus in Windows - Exclusion gets added during install

{% set version = '2.2.0-20220919' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set hash = '7accd179e8a6b2fc907e7e8d087c52a7f48084852724b03d25bebcada1acbca5' %}
{% set defender_status = salt['cmd.run']('powershell -c "(Get-Service windefend).Status"') %}

mimikatz-defender-exclusion-download-only:
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

mimikatz-download-only:
  file.managed:
    - name: '{{ downloads }}\mimikatz\mimikatz-{{ version }}.zip'
    - source: https://github.com/gentilkiwi/mimikatz/releases/download/{{ version }}/mimikatz_trunk.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
    - require:
      - cmd: mimikatz-defender-exclusion-download-only
