# Name: Hindsight
# Website: https://github.com/obsidianforensics/hindsight
# Description: Web-based Chromium Browser artifact parser (Chrome origins)
# Category: Windows Analysis
# Author: Obsidian Forensics
# License: Apache v2.0 (https://github.com/obsidianforensics/hindsight/blob/master/LICENSE.md)
# Version: 2026.01
# Notes:

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set version = '2026.01' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set files = [('hindsight.exe', '823d18cba5112874d4fbee7e3fb05de679fb708d45d0b7cad9ec7ee7f687d36b'),
                ('hindsight_gui.exe', 'ac5fea980f66188e3db26831154620885edda7d350716e42738a0728e66eaa86')] %}

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
{% endfor %}

hindsight-shim:
  cmd.run:
    - name: 'powershell -nop -ep Bypass -File {{ inpath }}\New-Shim.ps1 -SourceExe {{ inpath }}\hindsight\hindsight.exe -OutPath {{ inpath }}\shims\hindsight.exe'
    - require:
      - sls: winfor.config.shims

hindsight-gui-shim:
  cmd.run:
    - name: 'powershell -nop -ep Bypass -File {{ inpath }}\New-Shim.ps1 -SourceExe {{ inpath }}\hindsight\hindsight_gui.exe -OutPath {{ inpath }}\shims\hindsight_gui.exe'
    - require:
      - sls: winfor.config.shims

standalones-hindsight-gui-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\Hindsight GUI.lnk'
    - target: {{ inpath }}\hindsight\hindsight_gui.exe
    - force: True
    - working_dir: {{ inpath }}\hindsight\
    - makedirs: True
    - require:
      - file: hindsight-download-hindsight_gui.exe
