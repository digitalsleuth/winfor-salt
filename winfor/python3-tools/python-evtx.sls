# Name: python-evtx
# Website: https://github.com/williballenthin/python-evtx
# Description: Pure Python parser for Windows Event Logs
# Category: Windows Analysis
# Author: Willi Ballenthin
# License: Apache License v2.0 (https://github.com/williballenthin/python-evtx/blob/master/LICENSE.TXT)
# Version: 0.8.0
# Notes: evtx_dump.py, evtx_dump_json.py, evtx_dump_chunk_slack.py, evtx_eid_record_numbers.py, evtx_extract_record.py, evtx_filter_records.py, evtx_info.py, evtx_record_structure.py, evtx_structure.py, evtx_templates.py

{% set commit = '953520633f99c450253e8d7142d18e7fce03b684' %}

include:
  - winfor.packages.python3

python-evtx:
  pip.installed:
    - name: 'git+https://github.com/williballenthin/python-evtx.git@{{ commit }}'
    - bin_env: 'C:\Program Files\Python310\python.exe'
    - require:
      - sls: winfor.packages.python3
