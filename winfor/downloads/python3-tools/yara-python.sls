# Name: yara-python
# Website: https://github.com/VirusTotal/yara-python
# Description: Analyze files by generating rules around data to be found
# Category: Raw Parsers / Decoders
# Author: Victor M. Alvarez (plusvic)
# License: Apache License v2.0 (https://github.com/VirusTotal/yara-python/blob/master/LICENSE)
# Version: 4.2.3
# Notes:

{% set version = "4.2.3" %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

include:
  - winfor.standalones.portable-python3
  - winfor.downloads.packages.ms-vcpp-2015-build-tools

yara-python-folder-download-only:
  file.directory:
    - name: '{{ downloads }}\yara-python'
    - makedirs: True
    - force: True
    - win_inheritance: True

yara-python-download-only:
  cmd.run:
    - name: '{{ inpath }}\portable-python3\python.exe -m pip download -d packages yara-python'
    - cwd: '{{ downloads }}\yara-python\'
    - require:
      - sls: winfor.standalones.portable-python3
      - file: yara-python-folder-download-only
      - sls: winfor.downloads.packages.ms-vcpp-2015-build-tools
