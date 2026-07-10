# Name: TeraCopy
# Website: https://www.codesector.com/teracopy
# Description: File transfer utility for consistent and uninterrupted transfers
# Category: Utilities
# Author: Code Sector
# License: FREEWARE (private / non-commerical)
# Version: 4.0.0.37
# Notes:

{% set version = '4.0.0.37' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'teracopy-'~ version ~'.exe' %}
{% set exists = salt['file.file_exists'](downloads + '\\teracopy\\' + pkg) %}

{% if exists %}
teracopy-install-offline:
  cmd.run:
    - name: '{{ pkg }} /exenoupdates /quiet'
    - shell: cmd
    - cwd: '{{ downloads }}\teracopy\'

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
