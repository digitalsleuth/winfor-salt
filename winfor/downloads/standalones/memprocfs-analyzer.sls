# Name: MemProcFS-Analyzer
# Website: https://github.com/evild3ad/MemProcFS-Analyzer
# Description: Powershell script utilizing MemProcFS for additional analysis
# Category: Windows Analysis
# Author: Martin Willing / evild3ad
# License: GNU General Public License v3.0 (https://github.com/evild3ad/MemProcFS-Analyzer/blob/main/LICENSE)
# Version: 1.0
# Notes: 

{% set version = '1.0' %}
{% set hash = '8a67034ccadf009fde757b7b0d42fbd87cc5faf9640d975905e12595dffb23a7' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set tools = ['AmcacheParser','AppCompatCacheParser','EvtxECmd','RECmd','SBECmd'] %}
{% set entropy_ver = '1.1' %}
{% set elastic_ver = '8.11.1' %}
{% set ipinfo_ver = '3.2.0' %}
{% set jq_ver = '1.7' %}
{% set kib_ver = '8.11.1' %}
{% set lnk_ver = '0.2.0' %}
{% set memprocfs_ver = '5.9.3' %}
{% set memprocfs_date = '20240309' %}
{% set xsv_ver = '0.13.0' %}
{% set yara_ver = '4.3.2' %}
{% set yara_sub = '2150' %}
{% set zir_ver = '2.10.0' %}

include:
  - winfor.downloads.packages.clamav
  - winfor.downloads.packages.dokany
  - winfor.downloads.packages.importexcel
  - winfor.downloads.standalones.memprocfs
  - winfor.downloads.standalones.elasticsearch
  - winfor.downloads.standalones.entropy
  - winfor.downloads.standalones.ipinfo
  - winfor.downloads.standalones.jq
  - winfor.downloads.standalones.kibana
  - winfor.downloads.standalones.lnk-parser
  - winfor.downloads.standalones.xsv
  - winfor.downloads.standalones.yara
  - winfor.downloads.standalones.zircolite

memprocfs-analyzer-download-only:
  file.managed:
    - name: '{{ downloads }}\memprocfs-analyzer\MemProcFS-Analyzer-v{{ version }}.zip'
    - source: https://github.com/evild3ad/MemProcFS-Analyzer/releases/download/v{{ version }}/MemProcFS-Analyzer-v{{ version }}.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

memprocfs-analyzer-extract-download-only:
  archive.extracted:
    - name: '{{ downloads }}\memprocfs-analyzer\'
    - source: '{{ downloads }}\memprocfs-analyzer\MemProcFS-Analyzer-v{{ version }}.zip'
    - enforce_toplevel: False
    - require:
      - file: memprocfs-analyzer-download-only

memprocfs-analyzer-folder-rename-download-only:
  file.rename:
    - name: '{{ downloads }}\memprocfs-analyzer\memprocfs-analyzer'
    - source: '{{ downloads }}\memprocfs-analyzer\MemProcFS-Analyzer-v{{ version }}\'
    - force: True
    - makedirs: True
    - require:
      - archive: memprocfs-analyzer-extract-download-only

memprocfs-analyzer-yara-download-only:
  git.latest:
    - name: https://github.com/evild3ad/yara
    - target: '{{ downloads }}\memprocfs-analyzer\yara'
    - rev: main
    - force_clone: True
    - force_reset: True

{% for tool in tools %}
  {% set filePath = downloads + "\\" + tool + ".zip" %}
  {% set outFile = downloads + "\\memprocfs-analyzer\\memprocfs-analyzer\\Tools\\" + tool + "\\SHA1.txt" %}
memprocfs-analyzer-{{ tool }}-requirement-download-only:
  file.managed:
    - name: '{{ filePath }}'
    - source: https://f001.backblazeb2.com/file/EricZimmermanTools/net6/{{ tool }}.zip
    - skip_verify: True
    - makedirs: True

memprocfs-analyzer-{{ tool }}-requirement-extract-download-only:
  archive.extracted:
  {% if tool == 'EvtxECmd' or tool == 'RECmd' %}
    - name: '{{ downloads }}\memprocfs-analyzer\memprocfs-analyzer\Tools\'
  {% else %}
    - name: '{{ downloads }}\memprocfs-analyzer\memprocfs-analyzer\Tools\{{ tool }}\'
  {% endif %}
    - source: '{{ filePath }}'
    - enforce_toplevel: False
    - require:
      - file: memprocfs-analyzer-{{ tool }}-requirement-download-only

memprocfs-analyzer-{{ tool }}-hash-download-only:
  cmd.run:
    - name: 'Get-FileHash -Algorithm SHA1 -Path {{ filePath }} | Select -ExpandProperty Hash | Out-File {{ outFile }}'
    - shell: powershell
    - require:
      - archive: memprocfs-analyzer-{{ tool }}-requirement-extract-download-only
    - onlyif:
      - fun: file.file_exists
        path: '{{ filePath }}'

{% endfor %}

memprocfs-extract-download-only:
  archive.extracted:
    - name: '{{ downloads }}\memprocfs-analyzer\memprocfs-analyzer\Tools\MemProcFS\'
    - source: '{{ downloads }}\memprocfs\MemProcFS_files_and_binaries_v{{ memprocfs_ver }}-win_x64-{{ memprocfs_date }}.zip'
    - enforce_toplevel: False
    - require:
      - sls: winfor.downloads.standalones.memprocfs

elasticsearch-file-copy-download-only:
  file.copy:
    - name: '{{ downloads }}\memprocfs-analyzer\memprocfs-analyzer\Tools\Elasticsearch\'
    - source: '{{ downloads }}\elasticsearch\elasticsearch-{{ elastic_ver }}-windows-x86_x64.zip'
    - makedirs: True
    - force: True
    - win_inheritance: True
    - require:
      - sls: winfor.downloads.standalones.elasticsearch

entropy-file-copy-download-only:
  file.copy:
    - name: '{{ downloads }}\memprocfs-analyzer\memprocfs-analyzer\Tools\entropy\'
    - source: '{{ downloads }}\entropy\entropy-{{ entropy_ver }}-win64.zip'
    - makedirs: True
    - force: True
    - win_inheritance: True
    - require:
      - sls: winfor.downloads.standalones.entropy

ipinfo-file-copy-download-only:
  file.copy:
    - name: '{{ downloads }}\memprocfs-analyzer\memprocfs-analyzer\Tools\IPinfo\'
    - source: '{{ downloads }}\ipinfo\ipinfo_{{ ipinfo_ver }}_windows_amd64.zip'
    - makedirs: True
    - force: True
    - win_inheritance: True
    - require:
      - sls: winfor.downloads.standalones.ipinfo

jq-file-copy-download-only:
  file.copy:
    - name: '{{ downloads }}\memprocfs-analyzer\memprocfs-analyzer\Tools\jq\jq.exe'
    - source: '{{ downloads }}\jq\jq-win64-{{ jq_ver }}.exe'
    - makedirs: True
    - force: True
    - win_inheritance: True
    - require:
      - sls: winfor.downloads.standalones.jq

kibana-file-copy-download-only:
  file.copy:
    - name: '{{ downloads }}\memprocfs-analyzer\memprocfs-analyzer\Tools\Kibana\'
    - source: '{{ downloads }}\kibana\kibana-{{ kib_ver }}-windows-x86_x64.zip'
    - makedirs: True
    - force: True
    - win_inheritance: True
    - require:
      - sls: winfor.downloads.standalones.kibana

lnk-parser-file-copy-download-only:
  file.copy:
    - name: '{{ downloads }}\memprocfs-analyzer\memprocfs-analyzer\Tools\lnk_parser\lnk_parser.exe'
    - source: '{{ downloads }}\lnk-parser\lnk_parser_x86_64-{{ lnk_ver }}.exe'
    - makedirs: True
    - force: True
    - win_inheritance: True
    - require:
      - sls: winfor.downloads.standalones.lnk-parser

xsv-file-copy-download-only:
  file.copy:
    - name: '{{ downloads }}\memprocfs-analyzer\memprocfs-analyzer\Tools\xsv\'
    - source: '{{ downloads }}\xsv\xsv-{{ xsv_ver }}-x86_64-pc-windows-msvc.zip'
    - makedirs: True
    - force: True
    - win_inheritance: True
    - require:
      - sls: winfor.downloads.standalones.xsv

yara-file-copy-download-only:
  file.copy:
    - name: '{{ downloads }}\memprocfs-analyzer\memprocfs-analyzer\Tools\YARA\'
    - source: '{{ downloads }}\yara\yara-{{ yara_ver }}-{{ yara_sub }}-win64.zip'
    - makedirs: True
    - force: True
    - win_inheritance: True
    - require:
      - sls: winfor.downloads.standalones.yara

zircolite-file-copy-download-only:
  file.copy:
    - name: '{{ downloads }}\memprocfs-analyzer\memprocfs-analyzer\Tools\Zircolite\'
    - source: '{{ downloads }}\zircolite\zircolite_win10_x64_{{ zir_ver }}.7z'
    - makedirs: True
    - force: True
    - win_inheritance: True
    - require:
      - sls: winfor.downloads.standalones.zircolite
