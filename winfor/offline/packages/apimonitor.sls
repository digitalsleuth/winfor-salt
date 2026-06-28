# Name: API Monitor v2 Alpha
# Website: http://www.rohitab.com/apimonitor
# Description: Tool to monitor API calls by applications
# Category: Executables
# Author: Rohitab Batra
# License: 
# Version: v2r13
# Notes: 

{% set version = 'v2r13' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'api-monitor-'~ version ~'.exe' %}
{% set exists = salt['file.file_exists'](downloads + '\\api-monitor\\' + pkg) %}

{% if exists %}
apimonitor-install-offline:
  cmd.run:
    - name: '{{ pkg }} /v"/qn /norestart"'
    - shell: cmd
    - cwd: '{{ downloads }}\api-monitor'

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
