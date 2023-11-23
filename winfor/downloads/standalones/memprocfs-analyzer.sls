# Name: MemProcFS-Analyzer
# Website: https://github.com/evild3ad/MemProcFS-Analyzer
# Description: PowerShell script for memory analysis workflow.
# Category: Raw Parsers / Decoders
# Author: Martin Willing
# License: GNU General Public License v3.0 - https://github.com/evild3ad/MemProcFS-Analyzer/blob/main/LICENSE
# Version: 1.0
# Notes: 

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set version = '1.0' %}
{% set hash = '8A67034CCADF009FDE757B7B0D42FBD87CC5FAF9640D975905E12595DFFB23A7' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

memprocfs-analyzer-download-only:
  file.managed:
    - name: '{{ downloads }}\memprocfs-analyzer\MemProcFS-Analyzer-v{{ version }}.zip'
	  - source: https://github.com/evild3ad/MemProcFS-Analyzer/releases/download/v{{ version }}/MemProcFS-Analyzer-v{{ version }}.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
