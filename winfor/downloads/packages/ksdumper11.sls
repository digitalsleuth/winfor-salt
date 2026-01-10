# Name: KsDumper 11
# Website: https://github.com/mastercodeon31415/KsDumper-11
# Description: Kernel Space Dumper utility
# Category: Executables
# Author: mastercodeon31415
# License: GNU General Public License v3 (https://github.com/mastercodeon31415/KsDumper-11/blob/main/LICENSE)
# Version: 1.3.5H
# Notes:

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '1.3.5H' %}
{% set hash = '3d9c302a6cbcdc165b2bd6be776886b20a402c409f653ad3ee4ad4ccd6079c14' %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set defender_status = salt['cmd.powershell']('((Get-Service) -match "WinDefend").Name') %}

{% if defender_status.lower() == "windefend" %}
ksdumper11-defender-exclusion-download-only:
  cmd.run:
    - names:
      - 'echo "Defender is present on this system."'
      - 'Add-MpPreference -ExclusionPath "{{ downloads }}"'
      - 'Add-MpPreference -ExclusionPath "{{ PROGRAMDATA }}\Salt Project\Salt\var"'
    - shell: powershell
{% else %}

"Defender is not present on this system - no exclusions are required to download KsDumper11.":
  test.nop

{% endif %}

ksdumper11-download-only:
  file.managed:
    - name: '{{ downloads }}\ksdumper\KsDumper11-{{ version }}.zip'
    - source: https://github.com/mastercodeon314/KsDumper-11/releases/download/{{ version }}/KsDumper11.v{{ version }}.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
