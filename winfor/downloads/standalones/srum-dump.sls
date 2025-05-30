# Name: srum-dump
# Website: https://github.com/MarkBaggett/srum-dump
# Description: Tool to analyze data in the Windows System Resource Usage Monitor database
# Category: Windows Analysis
# Author: Mark Baggett
# License: GNU General Public License v3 (https://github.com/MarkBaggett/srum-dump/blob/master/LICENSE)
# Version: 3.0
# Notes: 

{% set version = '3.0' %}
{% set hash = 'bbb461a5d5445da91d93583586c638a9482204ccb896a54ddf6a86671d5d2399' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

srum-dump-download-only:
  file.managed:
    - name: '{{ downloads }}\srum-dump\srum-dump-{{ version }}.exe'
    - source: https://github.com/MarkBaggett/srum-dump/releases/download/v{{ version }}/srum_dump.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
