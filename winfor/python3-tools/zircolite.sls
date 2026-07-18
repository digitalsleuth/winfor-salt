# Name: Zircolite
# Website: https://github.com/wagga40/Zircolite
# Description: SIGMA-based detection for EVTX, Auditd and Sysmon for Linux
# Category: Logs
# Author: Wagga (wagga40)
# License: GNU Lesser Public License v3.0 (https://github.com/wagga40/Zircolite#license)
# Version: 3.7.6
# Notes: 

{% set version = '3.7.6' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set commit = 'b37b51eb00c49fc7bfd2f4968f1e5c3fc30da643' %}
{% set defender_status = salt['cmd.powershell']('((Get-Service) -match "WinDefend").Name') %}

{% if defender_status.lower() == "windefend" %}

zircolite-defender-exclusion:
  cmd.run:
    - names:
      - 'echo "Defender is present on the system."'
      - 'Add-MpPreference -ExclusionPath "{{ inpath }}"'
      - 'Add-MpPreference -ExclusionPath "{{ PROGRAMDATA }}\Salt Project\Salt\var"'
    - shell: powershell

{% else %}

"Defender is not present on the system - no exclusions required for Zircolite.":
  test.nop

{% endif %}

include:
  - winfor.packages.python3
  - winfor.packages.git

zircolite-source:
  git.latest:
    - name: https://github.com/wagga40/Zircolite
    - target: '{{ inpath }}\zircolite'
    - rev: {{ commit }}
    - force_clone: True
    - force_reset: True
    - require:
      - sls: winfor.packages.git

zircolite-requirements:
  pip.installed:
    - requirements: '{{ inpath }}\zircolite\requirements.txt'
    - bin_env: 'C:\Program Files\Python310\python.exe'
    - require:
      - git: zircolite-source
      - sls: winfor.packages.python3

zircolite-wrapper:
  file.managed:
    - name: 'C:\Program Files\Python310\Scripts\zircolite.cmd'
    - win_inheritance: True
    - contents:
      - '@echo off'
      - '"C:\Program Files\Python310\python.exe" "{{ inpath }}\zircolite\zircolite.py" %*'

zircolite-download-rules:
  file.managed:
    - name: '{{ inpath }}\zircolite\Zircolite-Rules.zip'
    - source: https://github.com/wagga40/Zircolite-Rules-v2/archive/refs/heads/main.zip
    - skip_verify: True
    - force: True
    - require:
      - git: zircolite-source
