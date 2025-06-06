# Name: fit - Freezing Internet Tool
# Website: https://github.com/fit-project/fit
# Description: Tool to forensically acquire web-based content like emails, social media, etc.
# Category: Acquisition and Analysis
# Author: https://github.com/orgs/fit-project/people
# License: GNU General Public License v3 (https://github.com/fit-project/fit/blob/main/LICENSE)
# Version: 2.2.0
# Notes: Requires npcap

{% set version = '2.2.0' %}
{% set hash = '8a5c6938408b228ebbe942aa2a4fc404853d39ca7b7c7f83df204c13e5b1030b' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

fit-download-only:
  file.managed:
    - name: '{{ downloads }}\fit\fit-portable-v{{ version }}-win64.zip'
    - source: https://github.com/fit-project/fit/releases/download/v{{ version }}/fit-portable-v{{ version }}-win64.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
