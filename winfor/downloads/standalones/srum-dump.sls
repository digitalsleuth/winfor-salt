# Name: srum-dump
# Website: https://github.com/MarkBaggett/srum-dump
# Description: Tool to analyze data in the Windows System Resource Usage Monitor database
# Category: Windows Analysis
# Author: Mark Baggett
# License: GNU General Public License v3 (https://github.com/MarkBaggett/srum-dump/blob/master/LICENSE)
# Version: 3.2
# Notes: 

{% set version = '3.2' %}
{% set hash = '43984652664baf21ebf44e660d70b59a61d38f36f8e4ff6dcd54640b24d7794a' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

srum-dump-download-only:
  file.managed:
    - name: '{{ downloads }}\srum-dump\srum-dump-{{ version }}.exe'
    - source: https://github.com/MarkBaggett/srum-dump/releases/download/v{{ version }}/srum_dump.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
