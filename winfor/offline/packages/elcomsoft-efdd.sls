# Name: Elcomsoft Forensic Disk Decryptor
# Website: https://www.elcomsoft.com/
# Description: Tool for decrypting disks or extracting encryption keys from memory
# Category: Acquisition and Analysis
# Author: Elcomsoft
# License: EULA (https://www.elcomsoft.com/legal.html)
# Version: 2.21.1036.8165
# Notes:

{% set version = '2.21.1036.8165' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'elcomsoft-efdd-' ~ version ~ '.msi' %}
{% set exists = salt['file.file_exists'](downloads + '\\elcomsoft-efdd\\' + pkg) %}

{% if exists %}
elcomsoft-efdd-install-offline:
  cmd.run:
    - name: 'msiexec /i {{ pkg }} /quiet /norestart'
    - shell: cmd
    - cwd: '{{ downloads }}\elcomsoft-efdd\'
{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}

