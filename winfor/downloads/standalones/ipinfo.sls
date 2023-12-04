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
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

ipinfo-download-only:
  file.managed:
    - name: '{{ downloads }}\ipinfo\ipinfo_{{ version }}_windows_amd64.zip'
    - source: https://github.com/ipinfo/cli/releases/download/ipinfo-{{ version }}/ipinfo_{{ version }}_windows_amd64.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
