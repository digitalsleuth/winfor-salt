# Name: Chainsaw
# Website: https://github.com/WithSecureLabs/Chainsaw
# Description: Event Log and Windows Artefact Parser
# Category: Logs
# Author: WithSecureLabs / Countercept
# License: GNU General Public License v3.0 (https://github.com/WithSecureLabs/chainsaw/blob/master/LICENCE)
# Version: 2.6.0
# Notes:

{% set version = '2.6.0' %}
{% set hash = '75135f3d6035530e1cc2cca09cb9177ed38ca17421b0d3c557d0c85685539f1e' %}
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
