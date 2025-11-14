# Name: YARA
# Website: https://virustotal.github.io/yara
# Description: Pattern Matching analysis tool
# Category: Utilities
# Author: VirusTotal (https://github.com/VirusTotal/yara/blob/master/AUTHORS)
# License: BSD 3-Clause (https://github.com/VirusTotal/yara/blob/master/COPYING)
# Version: 4.5.5
# Notes: 

{% set version = '4.5.5' %}
{% set subversion = '2368' %}
{% set hash = '352396c8a3d9b31b157a4820abd3b9347fc934a2314cdda8a4f566a5570163e4' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}

yara-download:
  file.managed:
    - name: 'C:\salt\tempdownload\yara-{{ version }}-{{ subversion }}-win64.zip'
    - source: https://github.com/VirusTotal/yara/releases/download/v{{ version }}/yara-{{ version }}-{{ subversion }}-win64.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

yara-extract:
  archive.extracted:
    - name: '{{ inpath }}\yara\'
    - source: 'C:\salt\tempdownload\yara-{{ version }}-{{ subversion }}-win64.zip'
    - enforce_toplevel: False
    - require:
      - file: yara-download

yara-env:
  win_path.exists:
    - name: '{{ inpath }}\yara\'
    - require:
      - archive: yara-extract

