# Name: Bulk Rename Utility
# Website: https://www.bulkrenameutility.co.uk
# Description: Tool to rename multiple files with similar names
# Category: Utilities
# Author: TGRMN Software
# License: EULA (https://www.bulkrenameutility.co.uk/License.php)
# Version: 4.0.0.9
# Notes: 

{% set version = '4.0.0.9' %}
{% set hash = '9ca2abd23bb19966f42020461b6bd6bf9a2f8a5e076601e38758aa768bd6f2fb' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

bulkrenameutility-download-only:
  file.managed:
    - name: '{{ downloads }}\bulk-rename-utility\BRU_setup_{{ version }}.exe'
    - source: https://www.bulkrenameutility.co.uk/Downloads/BRU_setup.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
