# Name: Microsoft PowerToys
# Website: https://github.com/microsoft/powertoys
# Description: Windows productivity system utilities
# Category: Utilities
# Author: Microsoft
# License: MIT (https://github.com/microsoft/PowerToys/blob/main/LICENSE)
# Version: 0.100.0
# Notes:

{% set version = '0.100.0' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'powertoys-'~ version ~'.exe' %}
{% set exists = salt['file.file_exists'](downloads + '\\powertoys\\' + pkg) %}

{% if exists %}
ms-powertoys-install-offline:
  cmd.run:
    - name: '{{ pkg }} /S'
    - shell: cmd
    - cwd: '{{ downloads }}\powertoys\'

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
