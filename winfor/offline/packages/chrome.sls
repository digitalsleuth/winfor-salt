# Name: Google Chrome
# Website: https://www.google.com
# Description: Google Web Browser
# Category: Browsers
# Author: Google
# License: https://policies.google.com/terms
# Version: 108.0.5359.72
# Notes: 

{% set version = '108.0.5359.72' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'google-chrome-enterprise.msi' %}
{% set exists = salt['file.file_exists'](downloads + '\\google-chrome\\' + pkg) %}

{% if exists %}
chrome-install-offline:
  cmd.run:
    - name: 'msiexec /i {{ pkg }} /qn /norestart'
    - shell: cmd
    - cwd: '{{ downloads }}\google-chrome\'

chrome-icon-remove-offline:
  file.absent:
    - name: 'C:\Users\Public\Desktop\Google Chrome.lnk'
    - require:
      - cmd: chrome-install-offline

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
