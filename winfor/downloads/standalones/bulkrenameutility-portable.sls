# Name: Bulk Rename Utility
# Website: https://www.bulkrenameutility.co.uk
# Description: Tool to rename multiple files with similar names
# Category: Utilities
# Author: TGRMN Software
# License: EULA (https://www.bulkrenameutility.co.uk/License.php)
# Version: 4.0.0.4
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set hash = '94f0181aa752b728224b0520cd17efead7610f08124e8750255e5ae933d261e7' %}
{% set version = '4.0.0.4' %}

bulkrenameutility-portable-download-only:
  file.managed:
    - name: '{{ downloads }}\bulk-rename-utility\BRU_NoInstall-{{ version }}.zip'
    - source: https://www.bulkrenameutility.co.uk/Downloads/BRU_NoInstall.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
