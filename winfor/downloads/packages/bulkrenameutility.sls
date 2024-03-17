# Name: Bulk Rename Utility
# Website: https://www.bulkrenameutility.co.uk
# Description: Tool to rename multiple files with similar names
# Category: Utilities
# Author: TGRMN Software
# License: EULA (https://www.bulkrenameutility.co.uk/License.php)
# Version: 3.4.4.0
# Notes: 

{% set version = '3.4.4.0' %}
{% set hash = '6359d8f55feeb92648b15fffa44bed2994ff1daa3d9d38ab45ad00799050f3d6' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

bulkrenameutility-download-only:
  file.managed:
    - name: '{{ downloads }}\bulk-rename-utility\BRU_setup-{{ version }}.exe'
    - source: https://www.bulkrenameutility.co.uk/Downloads/BRU_setup.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
