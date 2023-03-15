# Name: Bulk Rename Utility
# Website: https://www.bulkrenameutility.co.uk
# Description: Tool to rename multiple files with similar names
# Category: Utilities
# Author: TGRMN Software
# License: EULA (https://www.bulkrenameutility.co.uk/License.php)
# Version: 3.4.4
# Notes: 

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}

bulkrenameutility-portable-download:
  file.managed:
    - name: 'C:\salt\tempdownload\BRU_NoInstall.zip'
    - source: https://www.bulkrenameutility.co.uk/Downloads/BRU_NoInstall.zip
    - source_hash: sha256=81d1892ffe342bea788da1b79cbe084b8b3a533df33d697c7721d97eaf7ba3d6
    - makedirs: True

bulkrenameutility-portable-extract:
  archive.extracted:
    - name: '{{ inpath }}\bulk-rename-utility-portable\'
    - source: 'C:\salt\tempdownload\BRU_NoInstall.zip'
    - enforce_toplevel: False
    - require:
      - file: bulkrenameutility-portable-download
