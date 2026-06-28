# Name: Log Parser
# Website: https://www.microsoft.com
# Description: Event Log parser
# Category: Logs
# Author: Microsoft
# License: 
# Version: 2.2.10
# Notes: 

{% set version = '2.2.10' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% from 'winfor/_macros/is_installed.jinja' import check_installed %}
{% set installed = check_installed('Log Parser ' + ".".join(version.split(".")[:2])) | trim == 'true' %}
{% set pkg = 'logparser-'~ version ~'.msi' %}
{% set exists = salt['file.file_exists'](downloads + '\\logparser\\' + pkg) %}

{% if not installed %}
{% if exists %}

logparser-install-offline:
  cmd.run:
    - name: 'msiexec /i {{ pkg }} /quiet /norestart'
    - shell: cmd
    - cwd: '{{ downloads }}\logparser'

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
{% else %}
Log Parser {{ version }} is already installed:
  test.nop
{% endif %}
