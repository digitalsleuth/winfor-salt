# Name: Chainsaw
# Website: https://github.com/WithSecureLabs/Chainsaw
# Description: Event Log and Windows Artefact Parser
# Category: Logs
# Author: WithSecureLabs / Countercept
# License: GNU General Public License v3.0 (https://github.com/WithSecureLabs/chainsaw/blob/master/LICENCE)
# Version: 2.13.1
# Notes:

{% set version = '2.13.1' %}
{% set hash = '58bbf38cbc897413c49076a7f9251c0705a8a2bbd70fb3a68a86653061c76725' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set defender_status = salt['cmd.powershell']('((Get-Service) -match "WinDefend").Name') %}

{% if defender_status.lower() == "windefend" %}

chainsaw-defender-exclusion:
  cmd.run:
    - names:
      - 'echo "Defender is present on the system."'
      - 'Add-MpPreference -ExclusionPath "{{ inpath }}"'
      - 'Add-MpPreference -ExclusionPath "C:\salt\tempdownload"'
      - 'Add-MpPreference -ExclusionPath "{{ PROGRAMDATA }}\Salt Project\Salt\var"'
    - shell: powershell
{% else %}

"Defender is not present on the system - no exclusions required for Chainsaw":
  test.nop

{% endif %}

chainsaw-download:
  file.managed:
    - name: 'C:\salt\tempdownload\chainsaw_all_platforms+rules+examples.zip'
    - source: https://github.com/WithSecureLabs/chainsaw/releases/download/v{{ version }}/chainsaw_all_platforms+rules+examples.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

chainsaw-extract:
  archive.extracted:
    - name: '{{ inpath }}\'
    - source: 'C:\salt\tempdownload\chainsaw_all_platforms+rules+examples.zip'
    - enforce_toplevel: False
    - overwrite: True
    - if_missing: '{{ inpath }}\chainsaw'
    - require:
      - file: chainsaw-download

chainsaw-rename:
  file.rename:
    - name: '{{ inpath }}\chainsaw\chainsaw.exe'
    - source: '{{ inpath }}\chainsaw\chainsaw_x86_64-pc-windows-msvc.exe'
    - force: True
    - require:
      - archive: chainsaw-extract

chainsaw-env:
  win_path.exists:
    - name: '{{ inpath }}\chainsaw\'
