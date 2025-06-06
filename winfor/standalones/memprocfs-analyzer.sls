# Name: MemProcFS-Analyzer
# Website: https://github.com/evild3ad/MemProcFS-Analyzer
# Description: Powershell script utilizing MemProcFS for additional analysis
# Category: Raw Parsers / Decoders
# Author: Martin Willing / evild3ad
# License: GNU General Public License v3.0 (https://github.com/evild3ad/MemProcFS-Analyzer/blob/main/LICENSE)
# Version: 1.1.0
# Notes: 

{% set version = '1.1.0' %}
{% set hash = '5726e945b01563bb60aa8a2ecd47a7cda7d64fe0a453981d51c82d8fc1d50421' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set tools = ['AmcacheParser','AppCompatCacheParser','EvtxECmd','RECmd','SBECmd'] %}

include:
  - winfor.repos
  - winfor.packages.nuget
  - winfor.packages.clamav
  - winfor.packages.dokany
  - winfor.packages.git
  - winfor.packages.importexcel
  - winfor.packages.python3
  - winfor.standalones.memprocfs
  - winfor.standalones.elasticsearch
  - winfor.standalones.entropy
  - winfor.standalones.ipinfo
  - winfor.standalones.jq
  - winfor.standalones.kibana
  - winfor.standalones.lnk-parser
  - winfor.standalones.xsv
  - winfor.standalones.yara
  - winfor.standalones.zircolite

memprocfs-analyzer-download:
  file.managed:
    - name: 'C:\salt\tempdownload\MemProcFS-Analyzer-v{{ version }}.zip'
    - source: https://github.com/evild3ad/MemProcFS-Analyzer/releases/download/v{{ version }}/MemProcFS-Analyzer-v{{ version }}.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

memprocfs-analyzer-extract:
  archive.extracted:
    - name: '{{ inpath }}\'
    - source: 'C:\salt\tempdownload\MemProcFS-Analyzer-v{{ version }}.zip'
    - enforce_toplevel: False
    - require:
      - file: memprocfs-analyzer-download

{% if salt['file.directory_exists'](inpath + "\\memprocfs-analyzer") %}
memprocfs-analyzer-delete-directory:
  file.absent:
    - name: '{{ inpath }}\memprocfs-analyzer\'
    - force: True
{% endif %}

memprocfs-analyzer-folder-rename:
  file.rename:
    - name: '{{ inpath }}\memprocfs-analyzer'
    - source: '{{ inpath }}\MemProcFS-Analyzer-v{{ version }}\'
    - force: True
    - makedirs: True
    - require:
      - archive: memprocfs-analyzer-extract

memprocfs-analyzer-disable-updater:
  cmd.run:
    - name: Get-Content {{ inpath }}\memprocfs-analyzer\MemProcFS-Analyzer.ps1 | ForEach-Object { $_ -replace '^Updater', '#Updater'} | Set-Content -Encoding UTF8 {{ inpath }}\memprocfs-analyzer\MemProcFS-Analyzer-NoUpdater.ps1
    - shell: powershell
    - require:
      - file: memprocfs-analyzer-folder-rename

memprocfs-analyzer-ps1-rename:
  file.rename:
    - name: '{{ inpath }}\memprocfs-analyzer\MemProcFS-Analyzer.ps1'
    - source: '{{ inpath }}\memprocfs-analyzer\MemProcFS-Analyzer-NoUpdater.ps1'
    - force: True
    - makedirs: True
    - require:
      - cmd: memprocfs-analyzer-disable-updater

memprocfs-analyzer-yara:
  git.latest:
    - name: https://github.com/evild3ad/yara.git
    - target: '{{ inpath }}\memprocfs-analyzer\yara'
    - rev: main
    - force_clone: True
    - force_reset: True
    - require:
      - sls: winfor.packages.git
      - sls: winfor.standalones.memprocfs
      - file: memprocfs-analyzer-folder-rename

{% for tool in tools %}
  {% set filePath = "C:\\salt\\tempdownload\\" + tool + ".zip" %}
  {% set outFile = inpath + "\\memprocfs-analyzer\\Tools\\" + tool + "\\SHA1.txt" %}

memprocfs-analyzer-{{ tool }}-requirement:
  file.managed:
    - name: '{{ filePath }}'
    - source: https://download.mikestammer.com/net6/{{ tool }}.zip
    - skip_verify: True
    - makedirs: True

memprocfs-analyzer-{{ tool }}-requirement-extract:
  archive.extracted:
  {% if tool == 'EvtxECmd' or tool == 'RECmd' %}
    - name: '{{ inpath }}\memprocfs-analyzer\Tools\'
  {% else %}
    - name: '{{ inpath }}\memprocfs-analyzer\Tools\{{ tool }}\'
  {% endif %}
    - source: '{{ filePath }}'
    - enforce_toplevel: False
    - require:
      - file: memprocfs-analyzer-{{ tool }}-requirement

memprocfs-analyzer-{{ tool }}-hash:
  cmd.run:
    - name: 'Get-FileHash -Algorithm SHA1 -Path {{ filePath }} | Select -ExpandProperty Hash | Out-File {{ outFile }}'
    - shell: powershell
    - require:
      - archive: memprocfs-analyzer-{{ tool }}-requirement-extract
    - onlyif:
      - fun: file.file_exists
        path: '{{ filePath }}'

{% endfor %}

evtxecmd-sync:
  cmd.run:
    - name: '{{ inpath }}\memprocfs-analyzer\Tools\EvtxECmd\EvtxECmd.exe --sync'
    - shell: cmd

recmd-sync:
  cmd.run:
    - name: '{{ inpath }}\memprocfs-analyzer\Tools\RECmd\RECmd.exe --sync'
    - shell: cmd

memprocfs-folder-copy:
  file.copy:
    - name: '{{ inpath }}\memprocfs-analyzer\Tools\MemProcFS'
    - source: '{{ inpath }}\memprocfs'
    - makedirs: True
    - force: True
    - win_inheritance: True

elasticsearch-folder-copy:
  file.copy:
    - name: '{{ inpath }}\memprocfs-analyzer\Tools\Elasticsearch'
    - source: '{{ inpath }}\elasticsearch'
    - makedirs: True
    - force: True
    - win_inheritance: True

entropy-folder-copy:
  file.copy:
    - name: '{{ inpath }}\memprocfs-analyzer\Tools\entropy'
    - source: '{{ inpath }}\entropy'
    - makedirs: True
    - force: True
    - win_inheritance: True

ipinfo-folder-copy:
  file.copy:
    - name: '{{ inpath }}\memprocfs-analyzer\Tools\IPinfo'
    - source: '{{ inpath }}\ipinfo'
    - makedirs: True
    - force: True
    - win_inheritance: True

jq-folder-copy:
  file.copy:
    - name: '{{ inpath }}\memprocfs-analyzer\Tools\jq'
    - source: '{{ inpath }}\jq'
    - makedirs: True
    - force: True
    - win_inheritance: True

jq-file-rename:
  file.rename:
    - name: '{{ inpath }}\memprocfs-analyzer\Tools\jq\jq-win64.exe'
    - source: '{{ inpath }}\memprocfs-analyzer\Tools\jq\jq.exe'
    - makedirs: True
    - force: True
    - win_inheritance: True

kibana-folder-copy:
  file.copy:
    - name: '{{ inpath }}\memprocfs-analyzer\Tools\Kibana'
    - source: '{{ inpath }}\kibana'
    - makedirs: True
    - force: True
    - win_inheritance: True

lnk-parser-folder-copy:
  file.copy:
    - name: '{{ inpath }}\memprocfs-analyzer\Tools\lnk_parser'
    - source: '{{ inpath }}\lnk-parser'
    - makedirs: True
    - force: True
    - win_inheritance: True

lnk-parser-file-rename:
  file.rename:
    - name: '{{ inpath }}\memprocfs-analyzer\Tools\lnk_parser\lnk_parser_x86_64.exe'
    - source: '{{ inpath }}\memprocfs-analyzer\Tools\lnk_parser\lnk_parser.exe'
    - makedirs: True
    - force: True
    - win_inheritance: True

xsv-folder-copy:
  file.copy:
    - name: '{{ inpath }}\memprocfs-analyzer\Tools\xsv'
    - source: '{{ inpath }}\xsv'
    - makedirs: True
    - force: True
    - win_inheritance: True

yara-folder-copy:
  file.copy:
    - name: '{{ inpath }}\memprocfs-analyzer\Tools\YARA'
    - source: '{{ inpath }}\yara'
    - makedirs: True
    - force: True
    - win_inheritance: True

zircolite-folder-copy:
  file.copy:
    - name: '{{ inpath }}\memprocfs-analyzer\Tools\Zircolite'
    - source: '{{ inpath }}\zircolite'
    - makedirs: True
    - force: True
    - win_inheritance: True
