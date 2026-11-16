# Name: OpenHashTab
# Website: https://github.com/namazso/OpenHashTab
# Description: Shell extension for file hashing
# Category: Utilities
# Author: namazso
# License: GNU General Public License 3.0 (https://github.com/namazso/OpenHashTab/blob/master/COPYING)
# Version: 3.1.1
# Notes: 

{% set version = '3.1.1' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'openhashtab-'~ version ~'.msi' %}
{% set exists = salt['file.file_exists'](downloads + '\\openhashtab\\' + pkg) %}

{% if exists %}
openhashtab-install-offline:
  cmd.run:
    - name: '{{ pkg }} /qn /norestart'
    - shell: cmd
    - cwd: '{{ downloads }}\openhashtab\'

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
