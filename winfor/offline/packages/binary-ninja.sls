# Name: Binary Ninja
# Website: https://binary.ninja
# Description: Decompiler, Disassembler, Debugger
# Category: Executables
# Author: Vector 35
# License: Non-commercial / Student License (https://docs.binary.ninja/about/license.html)
# Version: 5.3.9757
# Notes: 

{% set version = '5.3.9757' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'binary-ninja-'~ version ~'.exe' %}
{% set exists = salt['file.file_exists'](downloads + '\\binary-ninja\\' + pkg) %}

{% if exists %}
binary-ninja-install-offline:
  cmd.run:
    - name: '{{ pkg }} /S /ALLUSERS'
    - shell: cmd
    - cwd: '{{ downloads }}\binary-ninja'

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
