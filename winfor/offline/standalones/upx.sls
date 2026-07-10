# Name: UPX
# Website: https://github.com/upx/upx
# Description: The Ultimate Packer for eXecutables
# Category: Executables
# Author: Markus Oberhumer, Laszlo Molnar, John Reiser
# License: Multiple Licenses (https://github.com/upx/upx/blob/devel/LICENSE)
# Version: 5.1.1
# Notes: 

{% set version = '5.1.1' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'upx-'~ version ~'.zip' %}
{% set exists = salt['file.file_exists'](downloads + '\\upx\\' + pkg) %}

{% if exists %}

upx-extract-offline:
  archive.extracted:
    - name: '{{ inpath }}\'
    - source: '{{ downloads }}\upx\{{ pkg }}'
    - enforce_toplevel: False

upx-folder-rename-offline:
  file.rename:
    - name: '{{ inpath }}\upx'
    - source: '{{ inpath }}\upx-{{ version }}-win64\'
    - force: True
    - makedirs: True
    - require:
      - archive: upx-extract-offline

upx-env-vars-offline:
  win_path.exists:
    - name: '{{ inpath }}\upx'

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
