# Name: Bulk Rename Utility
# Website: https://www.bulkrenameutility.co.uk
# Description: Tool to rename multiple files with similar names
# Category: Utilities
# Author: TGRMN Software
# License: EULA (https://www.bulkrenameutility.co.uk/License.php)
# Version: 4.1.0.0
# Notes: 

{% set version = '4.1.0.0' %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('bulkrenameutility') %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

bulkrenameutility-download-only:
  file.managed:
    - name: '{{ downloads }}\bulk-rename-utility\bulk-rename-utility-{{ version }}.exe'
    - source: https://www.s3.tgrmn.com/bru4/BRU_setup_{{ version }}.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
