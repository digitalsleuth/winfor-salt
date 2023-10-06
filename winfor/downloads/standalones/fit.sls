# Name: fit - Freezing Internet Tool
# Website: https://github.com/fit-project/fit
# Description: Tool to forensically acquire web-based content like emails, social media, etc.
# Category: Acquisition and Analysis
# Author: https://github.com/orgs/fit-project/people
# License: GNU General Public License v3 (https://github.com/fit-project/fit/blob/main/LICENSE)
# Version: 1.2.0
# Notes: Requires npcap

{% set version = '1.2.0' %}
{% set hash = '3b9e72b4b85a85b837bc2448dbee3a3bad94d3310b9020afa738235e58648b19' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

fit-download-only:
  file.managed:
    - name: '{{ downloads }}\fit-portable-win64-{{ version }}.zip'
    - source: https://github.com/fit-project/fit/releases/download/v{{ version }}/fit-portable-win64-{{ version }}.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
