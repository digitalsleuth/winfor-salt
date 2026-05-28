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

apimonitor-install-offline:
  cmd.run:
    - name: 'api-monitor-{{ version }}setup-x64.exe /v"/qn /norestart"'
    - shell: cmd
    - cwd: '{{ downloads }}\api-monitor'
