# Name: PE-bear
# Website: https://github.com/hasherezade/pe-bear
# Description: Portable Executable reversing tool with a GUI
# Category: Executables
# Author: hasherezade
# License: GNU General Public License v2 (https://github.com/hasherezade/pe-bear/blob/main/LICENSE)
# Version: 0.6.1
# Notes: 

{% set version = '0.6.1' %}
{% set hash = 'e08dd503d5699e593c7609d2d58ab73740c33a4d97bf887682349fe2f4d8a028' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

pe-bear-download-only:
  file.managed:
    - name: '{{ downloads }}\PE-bear_{{ version }}_x64_win_vs17.zip'
    - source: https://github.com/hasherezade/pe-bear/releases/download/v{{ version }}/PE-bear_{{ version }}_x64_win_vs17.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

pe-bear-sig-download-only:
  file.managed:
    - name: '{{ downloads }}\PE-BEAR-SIG.txt'
    - source: https://github.com/hasherezade/pe-bear/raw/main/SIG.txt
    - source_hash: sha256=247627cd61b15afd711dd88988a8622cef50e97b5b2a0ddfe9fcfc3eae29d2f1
    - makedirs: True
    - require:
      - file: pe-bear-download-only
