# Name: Sublime Text
# Website: https://www.sublimetext.com
# Description: Text Editor for markup and code
# Category: Documents / Editors
# Author: Sublime HQ Pty Ltd
# License: EULA (https://www.sublimehq.com/eula)
# Version: 4200
# Notes: 

{% set version = '4200' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'sublime-text-'~ version ~'.exe' %}
{% set exists = salt['file.file_exists'](downloads + '\\sublime-text\\' + pkg) %}

{% if exists %}
sublime-text-install-offline:
  cmd.run:
    - name: '{{ pkg }} /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
    - shell: cmd
    - cwd: '{{ downloads }}\sublime-text\'

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
