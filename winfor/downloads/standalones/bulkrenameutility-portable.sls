# Name: Bulk Rename Utility
# Website: https://www.bulkrenameutility.co.uk
# Description: Tool to rename multiple files with similar names
# Category: Utilities
# Author: TGRMN Software
# License: EULA (https://www.bulkrenameutility.co.uk/License.php)
# Version: 4.1.0.1
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set hash = 'f10f9cb37d3858f082da28c717ed7af2ee8e97163e03a7e265b3a99cfefcda02' %}
{% set version = '4.1.0.1' %}

bulkrenameutility-portable-download-only:
  file.managed:
    - name: '{{ downloads }}\bulk-rename-utility\BRU_NoInstall-{{ version }}.zip'
    - source: https://www.bulkrenameutility.co.uk/Downloads/BRU_NoInstall.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
