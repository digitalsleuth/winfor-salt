# Name: Chainsaw
# Website: https://github.com/WithSecureLabs/Chainsaw
# Description: Event Log and Windows Artefact Parser
# Category: Logs
# Author: WithSecureLabs / Countercept
# License: GNU General Public License v3.0 (https://github.com/WithSecureLabs/chainsaw/blob/master/LICENCE)
# Version: 2.8.1
# Notes:

{% set version = '2.8.1' %}
{% set hash = '2881fc8a3999281b05f4edbfa8941e518c83f60a53d713076f8df666cadae17f' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}

chainsaw-defender-exclusion:
  cmd.run:
    - names:
      - 'Add-MpPreference -ExclusionPath "{{ inpath }}\"'
      - 'Add-MpPreference -ExclusionPath "C:\salt\tempdownload\"'
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
