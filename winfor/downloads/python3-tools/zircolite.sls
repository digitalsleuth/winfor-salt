# Name: Zircolite
# Website: https://github.com/wagga40/Zircolite
# Description: SIGMA-based detection for EVTX, Auditd and Sysmon for Linux
# Category: Logs
# Author: Wagga (wagga40)
# License: GNU Lesser Public License v3.0 (https://github.com/wagga40/Zircolite#license)
# Version: 3.6.3
# Notes:

{% set version = '3.6.3' %}
{% set commit = '6b8c4fd918bd5c749bb29374fc3f8041b5743505' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
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

"Defender is not present on the system - no exclusions required for Zircolite download.":
  test.nop

{% endif %}

include:
  - winfor.packages.git
  - winfor.standalones.portable-python3

zircolite-download-only:
  git.latest:
    - name: https://github.com/wagga40/Zircolite
    - target: '{{ downloads }}\zircolite'
    - rev: {{ commit }}
    - force_clone: True
    - force_reset: True
    - require:
      - sls: winfor.packages.git

zircolite-requirements-download-only:
  cmd.run:
    - name: '{{ inpath }}\portable-python3\python.exe -m pip download -r requirements.txt -d packages'
    - cwd: '{{ downloads }}\zircolite'
    - require:
      - git: zircolite-download-only
      - sls: winfor.standalones.portable-python3

zircolite-rules-download-only:
  file.managed:
    - name: '{{ downloads }}\zircolite\Zircolite-Rules.zip'
    - source: https://github.com/wagga40/Zircolite-Rules-v2/archive/refs/heads/main.zip
    - skip_verify: True
    - force: True
    - require:
      - git: zircolite-download-only
