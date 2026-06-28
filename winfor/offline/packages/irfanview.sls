# Name: IrfanView x64
# Website: https://www.irfanview.com/64bit.htm
# Description: IrfanView image viewer and editor
# Category: Utilities
# Author: Irfan Skiljan
# License: https://www.irfanview.com/eula.htm
# Version: 4.73
# Notes:

{% set version = '473' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'irfanview-'~ version ~'.exe' %}
{% set exists = salt['file.file_exists'](downloads + '\\irfanview\\' + pkg) %}

{% if exists %}

irfanview-install-offline:
  cmd.run:
    - name: '{{ pkg }} /silent /desktop=0 /thumbs=0 /group=1 /allusers=1 /assoc=1'
    - shell: cmd
    - cwd: '{{ downloads }}\irfanview\'

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
