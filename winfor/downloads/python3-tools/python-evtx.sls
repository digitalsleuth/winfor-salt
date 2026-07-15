# Name: python-evtx
# Website: https://github.com/williballenthin/python-evtx
# Description: Pure Python parser for Windows Event Logs
# Category: Windows Analysis
# Author: Willi Ballenthin
# License: Apache License v2.0 (https://github.com/williballenthin/python-evtx/blob/master/LICENSE.TXT)
# Version: 0.8.1
# Notes: evtx_dump.py, evtx_dump_json.py, evtx_dump_chunk_slack.py, evtx_eid_record_numbers.py, evtx_extract_record.py, evtx_filter_records.py, evtx_info.py, evtx_record_structure.py, evtx_structure.py, evtx_templates.py

{% set version = '0.8.1' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set commit = '1edde3655c676bd44990ce9762d6b8f73334ed1d' %}
{% set hash = '387a0f804a72d509c5fcccded4fb53385a712dd25ed4e8eaef693a4086abb068' %}

include:
  - winfor.downloads.packages.python3
  - winfor.standalones.portable-python3

python-evtx-download-only:
  file.managed:
    - name: '{{ downloads }}\python-evtx-{{ version }}.zip'
    - source: https://github.com/williballenthin/python-evtx/archive/{{ commit }}.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

python-evtx-extract-download-only:
  archive.extracted:
    - name: '{{ downloads }}\'
    - source: '{{ downloads }}\python-evtx-{{ version }}.zip'
    - enforce_toplevel: False
    - require:
      - file: python-evtx-download-only

python-evtx-folder-rename-download-only:
  file.rename:
    - name: '{{ downloads }}\python-evtx'
    - source: '{{ downloads }}\python-evtx-{{ commit }}\'
    - makedirs: True
    - force: True
    - require:
      - archive: python-evtx-extract-download-only

python-evtx-python-download-only:
  cmd.run:
    - name: '{{ inpath }}\portable-python3\python.exe -m pip download -d packages . setuptools wheel'
    - cwd: '{{ downloads }}\python-evtx'
    - require:
      - sls: winfor.downloads.packages.python3
      - sls: winfor.standalones.portable-python3
      - file: python-evtx-folder-rename-download-only

python-evtx-remove-download-only:
  file.absent:
    - name: '{{ downloads }}\python-evtx-{{ version }}.zip'
    - require:
      - cmd: python-evtx-python-download-only
