# Name: Java Development Kit and Runtime Environment
# Website: https://www.java.com
# Description: Java Engine
# Category: Requirements
# Author: Oracle
# License: https://www.oracle.com/legal/terms.html
# Version: 21.0.7
# Notes: 

{% set version = '21.0.7' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% from 'winfor/_macros/is_installed.jinja' import check_installed %}
{% set installed = check_installed('Java(TM) SE Development Kit 21*') | trim == 'true' %}
{% set pkg = 'jdk-'~ version ~'.exe' %}
{% set exists = salt['file.file_exists'](downloads + '\\jdk21\\' + pkg) %}

{% if not installed %}
{% if exists %}

jdk21-offline:
  cmd.run:
    - name: '{{ pkg }} /s'
    - shell: cmd
    - cwd: '{{ downloads }}\jdk21'

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
{% else %}
JDK21 is already installed:
  test.nop
{% endif %}
