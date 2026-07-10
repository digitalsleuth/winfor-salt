# Name: winpmem
# Website: https://github.com/velocidex/WinPmem
# Description: Memory Acquisition Tool
# Category: Acquisition and Analysis
# Author: Mike Cohen (scudette)
# License: Apache License v2 (https://github.com/Velocidex/WinPmem/blob/master/LICENSE)
# Version: 4.0.rc2
# Notes:

{% set version = '4.0.rc1' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set files = ['winpmem_mini_x64_rc2.exe','winpmem_mini_x86.exe','go-winpmem_amd64_1.0-rc2_signed.exe'] %}
{% set pkg = 'winpmem_mini_x64_rc2.exe' %}
{% set exists = salt['file.file_exists'](downloads + '\\winpmem\\' + pkg) %}

{% if exists %}

{% for file in files %}
winpmem-copy-{{ file }}-offline:
  file.copy:
    - name: '{{ inpath }}\winpmem\{{ file }}'
    - source: '{{ downloads }}\winpmem\{{ file }}'
    - makedirs: True
    - replace: True
    - force: True
{% endfor %}

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}