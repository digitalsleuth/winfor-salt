# Name: Bulk Rename Utility
# Website: https://www.bulkrenameutility.co.uk
# Description: Tool to rename multiple files with similar names
# Category: Utilities
# Author: TGRMN Software
# License: EULA (https://www.bulkrenameutility.co.uk/License.php)
# Version: 4.0.0.4
# Notes: 

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set hash = '94f0181aa752b728224b0520cd17efead7610f08124e8750255e5ae933d261e7' %}
{% set version = '4.0.0.4' %}

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
