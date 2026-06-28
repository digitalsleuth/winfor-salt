# Name: Resource Hacker
# Website: https://www.angusj.com/resourcehacker
# Description: Compiler and Decompiler for Windows applications
# Category: Executables
# Author: Angus Johnson
# License: Freeware (http://www.angusj.com/resourcehacker - License to Use)
# Version: 5.2.8
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '5.2.8' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'resource-hacker-'~ version ~'.exe' %}
{% set exists = salt['file.file_exists'](downloads + '\\resource-hacker\\' + pkg) %}

{% if exists %}
resource-hacker-install-offline:
  cmd.run:
    - name: '{{ pkg }} /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /MERGETASKS=!DESKTOPICON,!RUNCODE'
    - shell: cmd
    - cwd: '{{ downloads }}\resource-hacker\'

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
