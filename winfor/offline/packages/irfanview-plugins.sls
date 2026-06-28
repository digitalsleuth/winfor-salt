# Name: IrfanView x64 Plugins
# Website: https://www.irfanview.com/64bit.htm
# Description: IrfanView Plugins
# Category: Utilities
# Author: Irfan Skiljan
# License: https://www.irfanview.com/eula.htm
# Version: 4.73
# Notes:

{% set version = '473' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'irfanview-plugins-'~ version ~'.exe' %}
{% set exists = salt['file.file_exists'](downloads + '\\irfanview\\' + pkg) %}

{% if exists %}
include:
  - winfor.offline.packages.irfanview

irfanview-plugins-install-offline:
  cmd.run:
    - name: '{{ pkg }} /silent'
    - shell: cmd
    - cwd: '{{ downloads }}\irfanview\'
    - require: 
      - sls: winfor.offline.packages.irfanview

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
