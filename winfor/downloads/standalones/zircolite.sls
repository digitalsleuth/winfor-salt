# Name: Zircolite
# Website: https://github.com/wagga40/Zircolite
# Description: SIGMA-based detection for EVTX, Auditd and Sysmon for Linux
# Category: Logs
# Author: Wagga (wagga40)
# License: GNU Lesser Public License v3.0 (https://github.com/wagga40/Zircolite#license)
# Version: 2.10.0
# Notes:

{% set version = '2.10.0' %}
{% set hash = '0cb5193ec3ed5b5e6275d4c5a35596219b14394f4b2ff795560a9b8038483fb9' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

zircolite-defender-exclusion-download-only:
  cmd.run:
    - names:
      - 'Add-MpPreference -ExclusionPath "{{ downloads }}\"'
    - shell: powershell

zircolite-download-only:
  file.managed:
    - name: '{{ downloads }}\zircolite\zircolite_win10_x64_{{ version }}.7z'
    - source: https://github.com/wagga40/Zircolite/releases/download/{{ version }}/zircolite_win10_x64_{{ version }}.7z
    - source_hash: sha256={{ hash }}
    - makedirs: True
    - require:
      - cmd: zircolite-defender-exclusion-download-only
