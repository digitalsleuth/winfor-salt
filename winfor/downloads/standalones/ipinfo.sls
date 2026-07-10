# Name: IPinfo
# Website: https://ipinfo.io
# Description: Command Line Interface for the IPinfo API
# Category: Network
# Author: https://github.com/orgs/ipinfo/people
# License: Apache License v2.0 (https://github.com/ipinfo/cli/blob/master/LICENSE)
# Version: 3.3.2
# Notes:

{% set version = '3.3.2' %}
{% set hash = '4dd90321cf023b941f8b53db4554cb83d8437879e890b9ecb2a7ca492b0556d3' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

ipinfo-download-only:
  file.managed:
    - name: '{{ downloads }}\ipinfo\ipinfo-{{ version }}.zip'
    - source: https://github.com/ipinfo/cli/releases/download/ipinfo-{{ version }}/ipinfo_{{ version }}_windows_amd64.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
