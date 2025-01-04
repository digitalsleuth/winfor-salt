# Name: Bulk Rename Utility
# Website: https://www.bulkrenameutility.co.uk
# Description: Tool to rename multiple files with similar names
# Category: Utilities
# Author: TGRMN Software
# License: EULA (https://www.bulkrenameutility.co.uk/License.php)
# Version: 4.0.0.3
# Notes: 

{% set version = '4.0.0.3' %}
{% set hash = '69a3fae1566b06f75be4ac5b2a813488b475230e32879191990895a3ce81fa0e' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

bulkrenameutility-download-only:
  file.managed:
    - name: '{{ downloads }}\bulk-rename-utility\BRU_setup_{{ version }}.exe'
    - source: https://www.bulkrenameutility.co.uk/Downloads/BRU_setup.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
