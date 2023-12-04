# Name: IPinfo
# Website: https://ipinfo.io
# Description: Command Line Interface for the IPinfo API
# Category: Network
# Author: https://github.com/orgs/ipinfo/people
# License: Apache License v2.0 (https://github.com/ipinfo/cli/blob/master/LICENSE)
# Version: 3.2.0
# Notes: 

{% set version = '3.2.0' %}
{% set hash = '14e924260c31066d73496a35bd59a4e229701768e105645d5d191119f0685aaf' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}

ipinfo-download:
  file.managed:
    - name: 'C:\salt\tempdownload\ipinfo_{{ version }}_windows_amd64.zip'
    - source: https://github.com/ipinfo/cli/releases/download/ipinfo-{{ version }}/ipinfo_{{ version }}_windows_amd64.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

ipinfo-extract:
  archive.extracted:
    - name: '{{ inpath }}\ipinfo\'
    - source: 'C:\salt\tempdownload\ipinfo_{{ version }}_windows_amd64.zip'
    - enforce_toplevel: False
    - require:
      - file: ipinfo-download

ipinfo-rename:
  file.rename:
    - name: '{{ inpath }}\ipinfo\ipinfo.exe'
    - source: '{{ inpath }}\ipinfo\ipinfo_{{ version }}_windows_amd64.exe'
    - force: True
    - makedirs: True
    - require:
      - archive: ipinfo-extract

ipinfo-env:
  win_path.exists:
    - name: '{{ inpath }}\ipinfo\'
    - require:
      - file: ipinfo-download
      - archive: ipinfo-extract
      - file: ipinfo-rename
