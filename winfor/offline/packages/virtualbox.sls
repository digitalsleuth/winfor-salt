# Name: Virtualbox
# Website: https://www.virtualbox.org/
# Description: Desktop virtualization software
# Category: Utilities
# Author: Oracle
# License: https://www.oracle.com/html/terms.html
# Version: 7.2.10-174163
# Notes: 

{% set version = '7.2.10' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'virtualbox-'~ version ~'.exe' %}
{% set exists = salt['file.file_exists'](downloads + '\\virtualbox\\' + pkg) %}

{% if exists %}
virtualbox-install-offline:
  cmd.run:
    - name: '{{ pkg }} --silent'
    - shell: cmd
    - cwd: '{{ downloads }}\virtualbox\'

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
