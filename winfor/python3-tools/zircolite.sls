# Name: Zircolite
# Website: https://github.com/wagga40/Zircolite
# Description: SIGMA-based detection for EVTX, Auditd and Sysmon for Linux
# Category: Logs
# Author: Wagga (wagga40)
# License: GNU Lesser Public License v3.0 (https://github.com/wagga40/Zircolite#license)
# Version: 4.7.1
# Notes: 

# renovate: datasource=github-releases depName=wagga40/Zircolite
{% set version = '4.7.1' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('zircolite') %}
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

zircolite-source:
  file.managed:
    - name: 'C:\salt\tempdownload\zircolite-{{ version }}.zip'
    - source: https://github.com/wagga40/Zircolite/archive/refs/tags/v{{ version }}.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

zircolite-extract:
  archive.extracted:
    - name: '{{ inpath }}\'
    - source: 'C:\salt\tempdownload\zircolite-{{ version }}.zip'
    - enforce_toplevel: False
    - require:
      - file: zircolite-source

zircolite-folder-rename:
  file.rename:
    - name: '{{ inpath }}\zircolite'
    - source: '{{ inpath }}\Zircolite-{{ version }}\'
    - force: True
    - makedirs: True
    - require:
      - archive: zircolite-extract

zircolite-install:
  pip.installed:
    - name: '{{ inpath }}\zircolite\'
    - bin_env: 'C:\Program Files\Python311\python.exe'
    - require:
      - file: zircolite-source
      - sls: winfor.packages.python3

zircolite-wrapper:
  file.managed:
    - name: 'C:\Program Files\Python311\Scripts\zircolite.cmd'
    - win_inheritance: True
    - contents:
      - '@echo off'
      - '"C:\Program Files\Python311\python.exe" "{{ inpath }}\zircolite\zircolite.py" %*'

zircolite-download-rules:
  file.managed:
    - name: '{{ inpath }}\zircolite\Zircolite-Rules.zip'
    - source: https://github.com/wagga40/Zircolite-Rules-v2/archive/refs/heads/main.zip
    - skip_verify: True
    - force: True
    - require:
      - file: zircolite-source
