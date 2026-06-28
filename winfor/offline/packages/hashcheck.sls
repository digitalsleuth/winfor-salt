# Name: HashCheck
# Website: https://github.com/gurnec/HashCheck
# Description: Context-Menu / Shell Extension hash generator utility
# Category: Utilities
# Author: Christopher Gurnee / Kai Liu / David B. Trout / Tim Schlueter
# License: https://github.com/gurnec/HashCheck/blob/master/license.txt
# Version: 2.4.0.55
# Notes:

{% set version = '2.4.0' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'hashcheck-'~ version ~'.exe' %}
{% set exists = salt['file.file_exists'](downloads + '\\hashcheck\\' + pkg) %}

{% if exists %}
hashcheck-install-offline:
  cmd.run:
    - name: '{{ pkg }} /S'
    - shell: cmd
    - cwd: '{{ downloads }}\hashcheck\'

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
