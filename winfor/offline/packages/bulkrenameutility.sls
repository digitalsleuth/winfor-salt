# Name: Bulk Rename Utility
# Website: https://www.bulkrenameutility.co.uk
# Description: Tool to rename multiple files with similar names
# Category: Utilities
# Author: TGRMN Software
# License: EULA (https://www.bulkrenameutility.co.uk/License.php)
# Version: 4.1.0.0
# Notes: 

{% set version = '4.1.0.0' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'bulk-rename-utility-'~ version ~'.exe' %}
{% set exists = salt['file.file_exists'](downloads + '\\bulk-rename-utility\\' + pkg) %}

{% if exists %}
bulkrenameutility-install-offline:
  cmd.run:
    - name: '{{ pkg }} /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /MERGETASKS=!DESKTOPICON,!RUNCODE'
    - shell: cmd
    - cwd: '{{ downloads }}\bulk-rename-utility'

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
