# Name: Bulk Rename Utility
# Website: https://www.bulkrenameutility.co.uk
# Description: Tool to rename multiple files with similar names
# Category: Utilities
# Author: TGRMN Software
# License: EULA (https://www.bulkrenameutility.co.uk/License.php)
# Version: 3.4.4
# Notes: 

{% set version = '3.4.4.0' %}
{% set hash = '6c178e80ab616d29390f3220469db21f7f705b8cbda902ca8d80d33438dd30e6' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

bulkrenameutility-download-only:
  file.managed:
    - name: '{{ downloads }}\BRU_setup.exe'
    - source: https://www.bulkrenameutility.co.uk/Downloads/BRU_setup.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
