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
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set defender_status = salt['cmd.powershell']('((Get-Service) -match "WinDefend").Name') %}

include:
  - winfor.packages.7zip

{% if defender_status.lower() == "windefend" %}

zircolite-defender-exclusion:
  cmd.run:
    - names:
      - 'echo "Defender is present on the system."'
      - 'Add-MpPreference -ExclusionPath "{{ inpath }}"'
      - 'Add-MpPreference -ExclusionPath "C:\salt\tempdownload"'
      - 'Add-MpPreference -ExclusionPath "{{ PROGRAMDATA }}\Salt Project\Salt\var"'
    - shell: powershell

{% else %}

"Defender is not present on the system - no exclusions required for Zircolite.":
  test.nop

{% endif %}

zircolite-download:
  file.managed:
    - name: 'C:\salt\tempdownload\zircolite_win_x64_{{ version }}.7z'
    - source: https://github.com/wagga40/Zircolite/releases/download/{{ version }}/zircolite_win_x64_{{ version }}.7z
    - source_hash: sha256={{ hash }}
    - makedirs: True

zircolite-extract:
  cmd.run:
    - name: '"C:\Program Files\7-Zip\7z.exe" x C:\salt\tempdownload\zircolite_win_x64_{{ version }}.7z -aoa -o{{ inpath }}\'
    - shell: cmd
    - require:
      - file: zircolite-download
      - sls: winfor.packages.7zip

zircolite-rename:
  file.rename:
    - name: '{{ inpath }}\zircolite'
    - source: '{{ inpath }}\zircolite_win'
    - force: True
    - makedirs: True
    - require:
      - cmd: zircolite-extract

zircolite-update:
  cmd.run:
    - name: '{{ inpath }}\zircolite\zircolite_win_x64_{{ version }}.exe --update-rules'
    - shell: cmd
    - require:
      - file: zircolite-rename

zircolite-env:
  win_path.exists:
    - name: '{{ inpath }}\zircolite\'
    - require:
      - file: zircolite-rename
