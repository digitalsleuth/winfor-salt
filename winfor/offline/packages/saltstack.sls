# Name: SaltStack
# Website: https://saltproject.io
# Description: Automation Software
# Category: Utilities
# Author: VMware, Inc
# License: Apache License 2.0 (https://github.com/saltstack/salt/blob/master/LICENSE)
# Version: 3007.2
# Notes:

{% set version = '3007.2' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'saltstack-' ~ version ~ '.exe' %}
{% set exists = salt['file.file_exists'](downloads + '\\saltstack\\' + pkg) %}
{% from 'winfor/_macros/is_installed.jinja' import check_installed %}
{% set installed = check_installed('Salt Minion ' +  version + '*') | trim == 'true' %}

{% if not installed %}
{% if exists %}

saltstack-install-offline:
  cmd.run:
    - name: '{{ pkg }} /S /master=localhost /minion-name=WIN-FOR'
    - shell: cmd
    - cwd: '{{ downloads }}\saltstack\'

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
{% else %}
SaltStack {{ version }} is already installed:
  test.nop
{% endif %}
