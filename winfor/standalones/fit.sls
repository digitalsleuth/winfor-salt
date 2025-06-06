# Name: fit - Freezing Internet Tool
# Website: https://github.com/fit-project/fit
# Description: Tool to forensically acquire web-based content like emails, social media, etc.
# Category: Acquisition and Analysis
# Author: https://github.com/orgs/fit-project/people
# License: GNU General Public License v3 (https://github.com/fit-project/fit/blob/main/LICENSE)
# Version: 2.2.0
# Notes: Requires npcap

{% set version = '2.2.0' %}
{% set hash = '8a5c6938408b228ebbe942aa2a4fc404853d39ca7b7c7f83df204c13e5b1030b' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

fit-download:
  file.managed:
    - name: 'C:\salt\tempdownload\fit-portable-v{{ version }}-win64.zip'
    - source: https://github.com/fit-project/fit/releases/download/v{{ version }}/fit-portable-v{{ version }}-win64.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

fit-extract:
  archive.extracted:
    - name: '{{ inpath }}\fit\'
    - source: 'C:\salt\tempdownload\fit-portable-v{{ version }}-win64.zip'
    - enforce_toplevel: False
    - require:
      - file: fit-download

fit-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\FIT.lnk'
    - target: '{{ inpath }}\fit\fit.exe'
    - force: True
    - working_dir: '{{ inpath }}\fit\'
    - makedirs: True
    - require:
      - file: fit-download
      - archive: fit-extract
