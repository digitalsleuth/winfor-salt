# Name: Sysinternals
# Website: https://sysinternals.com
# Description: Suite of Windows Analysis and Management Tools
# Category: Windows Analysis
# Author: Microsoft / Mark Russinovich
# License: https://learn.microsoft.com/en-us/sysinternals/license-terms
# Version: 2026.05.07 (date of last update - no specific version number identified)
# Notes: 

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set version = '2026.05.07' %}
{% set hash = 'e45ce0b3fd6d0457e253f132ef086c6c4715def16e59433de2cb5dfe2c16a76f' %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

sysinternals:
  file.managed:
    - name: 'C:\salt\tempdownload\SysinternalsSuite.zip'
    - source: https://download.sysinternals.com/files/SysinternalsSuite.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

sysinternals-extract:
  archive.extracted:
    - name: '{{ inpath }}\sysinternals\'
    - source: 'C:\salt\tempdownload\SysinternalsSuite.zip'
    - enforce_toplevel: false
    - require:
      - file: sysinternals

sysinternals-env-vars:
  win_path.exists:
    - name: '{{ inpath }}\sysinternals'

standalones-sysinternals-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\Sysinternals.lnk'
    - target: '{{ inpath }}\sysinternals\'
    - force: True
    - working_dir: '{{ inpath }}\sysinternals\'
    - makedirs: True
    - require:
      - file: sysinternals
      - archive: sysinternals-extract
