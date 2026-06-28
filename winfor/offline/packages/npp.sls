# Name: Notepad++
# Website: https://notepad-plus-plus.org
# Description: Free source code / text editor
# Category: Documents / Editors
# Author: Don Ho
# License: GNU General Public License 2.0 (https://notepad-plus-plus.org/)
# Version: 8.9.6.4
# Notes: 

{% set version = '8.9.6.4' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'npp-'~ version ~'.exe' %}
{% set exists = salt['file.file_exists'](downloads + '\\npp\\' + pkg) %}

{% if exists %}
npp-install-offline:
  cmd.run:
    - name: '{{ pkg }} /S'
    - shell: cmd
    - cwd: '{{ downloads }}\npp\'

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
