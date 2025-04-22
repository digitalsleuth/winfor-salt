# Name: Bulk Rename Utility
# Website: https://www.bulkrenameutility.co.uk
# Description: Tool to rename multiple files with similar names
# Category: Utilities
# Author: TGRMN Software
# License: EULA (https://www.bulkrenameutility.co.uk/License.php)
# Version: 4.0.0.7
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set hash = '3a1953db2db77baa74e1939a81f8aaac414fb48e061892114a13e788457b4292' %}
{% set version = '4.0.0.7' %}

bulkrenameutility-portable-download-only:
  file.managed:
    - name: '{{ downloads }}\bulk-rename-utility\BRU_NoInstall-{{ version }}.zip'
    - source: https://www.bulkrenameutility.co.uk/Downloads/BRU_NoInstall.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
