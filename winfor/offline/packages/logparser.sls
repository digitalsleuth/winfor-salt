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

{% if not installed %}

logparser-install-offline:
  cmd.run:
    - name: 'msiexec /i LogParser-{{ version }}.msi /quiet /norestart'
    - cwd: '{{ downloads }}\logparser'

{% else %}
"Log Parser {{ version }} is already installed":
  test.nop
{% endif %}
