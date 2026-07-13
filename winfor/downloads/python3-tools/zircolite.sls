# Name: Zircolite
# Website: https://github.com/wagga40/Zircolite
# Description: SIGMA-based detection for EVTX, Auditd and Sysmon for Linux
# Category: Logs
# Author: Wagga (wagga40)
# License: GNU Lesser Public License v3.0 (https://github.com/wagga40/Zircolite#license)
# Version: 3.7.6
# Notes:

{% set version = '3.7.6' %}
{% set hash = '18cf1845eb4ebb3198e24b86e6d91cc7e8408775c600092a0c64e6437ec86e5b' %}
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
  - winfor.standalones.portable-python3

zircolite-download-only:
  file.managed:
    - name: '{{ downloads }}\zircolite-{{ version }}.zip'
    - source: https://github.com/wagga40/Zircolite/archive/refs/tags/v{{ version }}.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

zircolite-extract-download-only:
  archive.extracted:
    - name: '{{ downloads }}\'
    - source: '{{ downloads }}\zircolite-{{ version }}.zip'
    - enforce_toplevel: False
    - require:
      - file: zircolite-download-only

zircolite-folder-rename-download-only:
  file.rename:
    - name: '{{ downloads }}\zircolite'
    - source: '{{ downloads }}\Zircolite-{{ version }}\'
    - force: True
    - makedirs: True
    - require:
      - archive: zircolite-extract-download-only

zircolite-requirements-download-only:
  cmd.run:
    - name: '{{ inpath }}\portable-python3\python.exe -m pip download -r requirements.txt -d packages'
    - cwd: '{{ downloads }}\zircolite'
    - require:
      - file: zircolite-folder-rename-download-only
      - sls: winfor.standalones.portable-python3

zircolite-rules-download-only:
  file.managed:
    - name: '{{ downloads }}\zircolite\Zircolite-Rules.zip'
    - source: https://github.com/wagga40/Zircolite-Rules-v2/archive/refs/heads/main.zip
    - skip_verify: True
    - force: True
    - require:
      - cmd: zircolite-requirements-download-only

zircolite-remove-download-only:
  file.absent:
    - name: '{{ downloads }}\zircolite-{{ version }}.zip'
    - require:
      - archive: zircolite-extract-download-only
