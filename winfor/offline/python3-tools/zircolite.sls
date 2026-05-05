# Name: Zircolite
# Website: https://github.com/wagga40/Zircolite
# Description: SIGMA-based detection for EVTX, Auditd and Sysmon for Linux
# Category: Logs
# Author: Wagga (wagga40)
# License: GNU Lesser Public License v3.0 (https://github.com/wagga40/Zircolite#license)
# Version: 3.6.3
# Notes:

{% set version = '3.6.3' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set defender_status = salt['cmd.powershell']('((Get-Service) -match "WinDefend").Name') %}

{% if defender_status.lower() == "windefend" %}

zircolite-defender-exclusion-offline:
  cmd.run:
    - names:
      - 'echo "Defender is present on the system."'
      - 'Add-MpPreference -ExclusionPath "{{ inpath }}"'
      - 'Add-MpPreference -ExclusionPath "{{ downloads }}"'
    - shell: powershell

{% else %}

"Defender is not present on the system - no exclusions required for Zircolite offline.":
  test.nop

{% endif %}

include:
  - winfor.offline.packages.python3

zircolite-copy-offline:
  file.copy:
    - name: '{{ inpath }}\zircolite'
    - source: '{{ downloads }}\zircolite'
    - recurse: True
    - force: True

zircolite-install-requirements-offline:
  cmd.run:
    - name: '"C:\Program Files\Python310\python.exe" -m pip install --no-index --find-links=.\packages -r requirements.txt'
    - cwd: '{{ inpath }}\zircolite'
    - require:
      - file: zircolite-copy-offline

zircolite-wrapper-offline:
  file.managed:
    - name: 'C:\Program Files\Python310\Scripts\zircolite.cmd'
    - win_inheritance: True
    - contents:
      - '@echo off'
      - 'python3 "{{ inpath }}\zircolite\zircolite.py" %*'
