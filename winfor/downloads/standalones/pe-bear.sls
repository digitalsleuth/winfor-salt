# Name: PE-bear
# Website: https://github.com/hasherezade/pe-bear
# Description: Portable Executable reversing tool with a GUI
# Category: Executables
# Author: hasherezade
# License: GNU General Public License v2 (https://github.com/hasherezade/pe-bear/blob/main/LICENSE)
# Version: 0.6.7.3
# Notes: 

{% set version = '0.6.7.3' %}
{% set hash = '22146f303e29de8e00c327ed8d32c46a86eb351875447859286962d11ddb25cc' %}
{% set sig_hash = 'b9b091d99c6263978eaf387ed18d9a743f88e7e3f5fd959ecc9057461fd981fc' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

pe-bear-download-only:
  file.managed:
    - name: '{{ downloads }}\pe-bear\PE-bear_{{ version }}_x64_win_vs19.zip'
    - source: https://github.com/hasherezade/pe-bear/releases/download/v{{ version }}/PE-bear_{{ version }}_x64_win_vs19.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

pe-bear-sig-download-only:
  file.managed:
    - name: '{{ downloads }}\pe-bear\PE-BEAR-SIG.txt'
    - source: https://github.com/hasherezade/pe-bear/raw/main/SIG.txt
    - source_hash: sha256={{ sig_hash }}
    - makedirs: True
    - require:
      - file: pe-bear-download-only
