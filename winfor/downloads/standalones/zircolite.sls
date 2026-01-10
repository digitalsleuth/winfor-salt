# Name: Zircolite
# Website: https://github.com/wagga40/Zircolite
# Description: SIGMA-based detection for EVTX, Auditd and Sysmon for Linux
# Category: Logs
# Author: Wagga (wagga40)
# License: GNU Lesser Public License v3.0 (https://github.com/wagga40/Zircolite#license)
# Version: 2.40.0
# Notes:

{% set version = '2.40.0' %}
{% set hash = '6e867b3b9a4aa4a376fd46121000f81da7c9011451caa329de877c7a7ef597b2' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set defender_status = salt['cmd.powershell']('((Get-Service) -match "WinDefend").Name') %}

{% if defender_status.lower() == "windefend" %}
zircolite-defender-exclusion-download-only:
  cmd.run:
    - names:
      - 'echo "Defender is present on the system."'
      - 'Add-MpPreference -ExclusionPath "{{ downloads }}"'
      - 'Add-MpPreference -ExclusionPath "{{ PROGRAMDATA }}\Salt Project\Salt\var"'
    - shell: powershell

{% else %}

"Defender is not present on the system - no exclusions required to download Zircolite.":
  test.nop

{% endif %}

zircolite-download-only:
  file.managed:
    - name: '{{ downloads }}\zircolite\zircolite_win_x64_{{ version }}.7z'
    - source: https://github.com/wagga40/Zircolite/releases/download/{{ version }}/zircolite_win_x64_{{ version }}.7z
    - source_hash: sha256={{ hash }}
    - makedirs: True
