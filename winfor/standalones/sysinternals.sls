# Name: Sysinternals
# Website: https://sysinternals.com
# Description: Suite of Windows Analysis and Management Tools
# Category: Windows Analysis
# Author: Microsoft / Mark Russinovich
# License: https://learn.microsoft.com/en-us/sysinternals/license-terms
# Version: 2026.08.12 (date of last update - no specific version number identified)
# Notes: 

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set version = '2026.08.12' %}
{% set hash = '6d471cfb9509cdd1dcec172c8dee330d8f0783dc9ede5ea720107f7804b2a10b' %}
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
