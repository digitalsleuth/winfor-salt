# Name: Bulk Rename Utility
# Website: https://www.bulkrenameutility.co.uk
# Description: Tool to rename multiple files with similar names
# Category: Utilities
# Author: TGRMN Software
# License: EULA (https://www.bulkrenameutility.co.uk/License.php)
# Version: 4.1.0.0
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set hash = '6435bd3d3db88190888ba5888655bfc7928f595a0ce5e9db36c3b207b98d3720' %}
{% set version = '4.1.0.0' %}

bulkrenameutility-portable-download-only:
  file.managed:
    - name: '{{ downloads }}\bulk-rename-utility\BRU_NoInstall-{{ version }}.zip'
    - source: https://www.bulkrenameutility.co.uk/Downloads/BRU_NoInstall.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
