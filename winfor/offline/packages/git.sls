# Name: Git for Windows
# Website: https://github.com/git-for-windows/git
# Description: Version Control System for Windows
# Category: Requirements
# Author: Git (git-scm.com)
# License: GNU Public License and Lesser GNU Public License (https://github.com/git-for-windows/git/blob/main/COPYING, https://github.com/git-for-windows/git/blob/main/LGPL-2.1)
# Version: 2.49.0
# Notes: 

{% set version = '2.49.0' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'git-'~ version ~'.exe' %}
{% set exists = salt['file.file_exists'](downloads + '\\git\\' + pkg) %}

{% if exists %}
git-install-offline:
  cmd.run:
    - name: '{{ pkg }} /VERYSILENT /NORESTART /SP- /NOCANCEL /SUPPRESSMSGBOXES'
    - shell: cmd
    - cwd: '{{ downloads }}\git\'

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
