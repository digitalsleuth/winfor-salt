# Name: Chainsaw
# Website: https://github.com/WithSecureLabs/Chainsaw
# Description: Event Log and Windows Artefact Parser
# Category: Windows Analysis
# Author: WithSecureLabs / Countercept
# License: GNU General Public License v3.0 (https://github.com/WithSecureLabs/chainsaw/blob/master/LICENCE)
# Version: 2.3.1
# Notes:

{% set version = '2.3.1' %}
{% set hash = '443C158C64502131ACA786C87F000BA6F8EC54F860A792060461BE08EB071DF3' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}

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
