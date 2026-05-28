# Name: yara-python
# Website: https://github.com/VirusTotal/yara-python
# Description: Analyze files by generating rules around data to be found
# Category: Raw Parsers / Decoders
# Author: Victor M. Alvarez (plusvic)
# License: Apache License v2.0 (https://github.com/VirusTotal/yara-python/blob/master/LICENSE)
# Version: 4.2.3
# Notes: 

{% set version = "4.2.3" %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}

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
