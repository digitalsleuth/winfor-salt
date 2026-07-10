# Name: yara-python
# Website: https://github.com/VirusTotal/yara-python
# Description: Analyze files by generating rules around data to be found
# Category: Raw Parsers / Decoders
# Author: Victor M. Alvarez (plusvic)
# License: Apache License v2.0 (https://github.com/VirusTotal/yara-python/blob/master/LICENSE)
# Version: 4.5.4
# Notes: 

{% set version = '4.5.4' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'yara_python-'~ version ~'-cp310-cp310-win_amd64.whl' %}
{% set exists = salt['file.file_exists'](downloads + '\\yara-python\\packages\\' + pkg) %}

{% if exists %}

include:
  - winfor.offline.packages.python3
  - winfor.offline.packages.ms-vcpp-2015-build-tools

yara-python-install-offline:
  cmd.run:
    - name: '"C:\Program Files\Python310\python.exe" -m pip install --no-index --find-links=.\packages yara-python'
    - cwd: '{{ downloads }}\yara-python\'
    - require:
      - sls: winfor.offline.packages.python3
      - sls: winfor.offline.packages.ms-vcpp-2015-build-tools

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
