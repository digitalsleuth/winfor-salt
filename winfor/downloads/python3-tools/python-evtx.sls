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

include:
  - winfor.downloads.packages.python3
  - winfor.standalones.portable-python3
  - winfor.packages.git

python-evtx-folder-download-only:
  file.directory:
    - name: '{{ downloads }}\python-evtx'
    - makedirs: True
    - force: True

python-evtx-download-only:
  cmd.run:
    - name: '{{ inpath }}\portable-python3\python.exe -m pip download -d packages git+https://github.com/williballenthin/python-evtx.git@{{ commit }}'
    - cwd: '{{ downloads }}\python-evtx'
    - require:
      - sls: winfor.downloads.packages.python3
      - sls: winfor.standalones.portable-python3
      - sls: winfor.packages.git
      - file: python-evtx-folder-download-only
