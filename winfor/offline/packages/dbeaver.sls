# Name: dbeaver
# Website: https://github.com/dbeaver/dbeaver
# Description: SQL Database tool and client
# Category: Databases
# Author: Serge Rider and Contributors (https://github.com/dbeaver/dbeaver/graphs/contributors)
# License: Apache License 2.0 (https://github.com/dbeaver/dbeaver/blob/devel/LICENSE.md)
# Version: 25.2.4
# Notes: 

{% set version = '25.2.4' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'dbeaver-'~ version ~'.exe' %}
{% set exists = salt['file.file_exists'](downloads + '\\dbeaver\\' + pkg) %}

{% if exists %}
dbeaver-install-offline:
  cmd.run:
    - name: '{{ pkg }} /S /allusers'
    - shell: cmd
    - cwd: '{{ downloads }}\dbeaver\'

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
