# Name: Hindsight
# Website: https://github.com/obsidianforensics/hindsight
# Description: Web-based Chromium Browser artifact parser (Chrome origins)
# Category: Windows Analysis
# Author: Obsidian Forensics
# License: Apache v2.0 (https://github.com/obsidianforensics/hindsight/blob/master/LICENSE.md)
# Version: 2026.04
# Notes:

{% set version = '2026.04' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set files = [('hindsight.exe', '1c1df0399ac0f7f5140cbeed8077205bff5335e6ba356e53c59488abba38b00e'),
                ('hindsight_gui.exe', 'c3bbf468992db37512a3f92cf5e8a11532f1a6fd016e36215e0755473fca3907')] %}

include:
  - winfor.config.shims

{% for file, hash in files %}

hindsight-download-{{ file }}:
  file.managed:
    - name: '{{ inpath }}\hindsight\{{ file }}'
    - source: https://github.com/obsidianforensics/hindsight/releases/download/v{{ version }}/{{ file }}
    - source_hash: sha256={{ hash }}
    - makedirs: True
    - replace: True

hindsight-shim-{{ file }}:
  cmd.run:
    - name: 'powershell -nop -ep Bypass -File {{ inpath }}\New-Shim.ps1 -SourceExe {{ inpath }}\hindsight\{{ file }} -OutPath {{ inpath }}\shims\{{ file }}'
    - require:
      - sls: winfor.config.shims

{% endfor %}

standalones-hindsight-gui-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\Hindsight GUI.lnk'
    - target: {{ inpath }}\hindsight\hindsight_gui.exe
    - force: True
    - working_dir: {{ inpath }}\hindsight\
    - makedirs: True
    - require:
      - file: hindsight-download-hindsight_gui.exe
