# Name: Bulk Rename Utility
# Website: https://www.bulkrenameutility.co.uk
# Description: Tool to rename multiple files with similar names
# Category: Utilities
# Author: TGRMN Software
# License: EULA (https://www.bulkrenameutility.co.uk/License.php)
# Version: 4.1.0.1
# Notes: 

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set hash = 'f10f9cb37d3858f082da28c717ed7af2ee8e97163e03a7e265b3a99cfefcda02' %}
{% set version = '4.1.0.1' %}

bulkrenameutility-portable-download:
  file.managed:
    - name: 'C:\salt\tempdownload\BRU_NoInstall_{{ version }}.zip'
    - source: https://www.bulkrenameutility.co.uk/Downloads/BRU_NoInstall.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

bulkrenameutility-portable-extract:
  archive.extracted:
    - name: '{{ inpath }}\bulk-rename-utility-portable\'
    - source: 'C:\salt\tempdownload\BRU_NoInstall_{{ version }}.zip'
    - enforce_toplevel: False
    - require:
      - file: bulkrenameutility-portable-download
