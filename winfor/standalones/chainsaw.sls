# Name: Chainsaw
# Website: https://github.com/WithSecureLabs/Chainsaw
# Description: Event Log and Windows Artefact Parser
# Category: Logs
# Author: WithSecureLabs / Countercept
# License: GNU General Public License v3.0 (https://github.com/WithSecureLabs/chainsaw/blob/master/LICENCE)
# Version: 2.12.2
# Notes:

{% set version = '2.12.2' %}
{% set hash = '483dfa39e7864b03bb4cf7cdf044568d4d2804cbcb08eb36da1af6353699ec7f' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set defender_status = salt['cmd.run']('powershell -c "(Get-Service windefend).Status"') %}

chainsaw-defender-exclusion:
  cmd.run:
{% if defender_status == "Running" %}
    - names:
      - 'echo "Defender is {{ defender_status }}"'
      - 'Add-MpPreference -ExclusionPath "{{ inpath }}"'
      - 'Add-MpPreference -ExclusionPath "C:\salt\tempdownload"'
      - 'Add-MpPreference -ExclusionPath "{{ PROGRAMDATA }}\Salt Project\Salt\var"'
{% else %}
    - name:
      - 'echo "Defender is {{ defender_status }}"'
{% endif %}
    - shell: powershell

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
      - cmd: chainsaw-defender-exclusion

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
