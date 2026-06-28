# Name: IDA Free
# Website: https://hex-rays.com/ida-free
# Description: Binary analysis tool for x86/x64 applications
# Category: Executables
# Author: hex-rays
# License: Free for Educational, Personal, and non-Commercial use
# Version: 8.3
# Notes: 

{% set version = '8.3' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'ida-free-'~ version ~'.exe' %}
{% set exists = salt['file.file_exists'](downloads + '\\ida-free\\' + pkg) %}

{% if exists %}
ida-free-install-offline:
  cmd.run:
    - name: '{{ pkg }} --mode unattended'
    - shell: cmd
    - cwd: '{{ downloads }}\ida-free\'

ida-free-remove-shortcut-offline:
  file.absent:
    - name: 'C:\Users\Public\Desktop\IDA Freeware {{ version }}.lnk'
    - require:
      - cmd: ida-free-install-offline
    - watch:
      - cmd: ida-free-install-offline

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}

