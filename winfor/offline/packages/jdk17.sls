# Name: Java Development Kit and Runtime Environment
# Website: https://www.java.com
# Description: Java Engine
# Category: Requirements
# Author: Oracle
# License: https://www.oracle.com/legal/terms.html
# Version: 17.0.9
# Notes: 

{% set version = '17.0.9' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% from 'winfor/_macros/is_installed.jinja' import check_installed %}
{% set installed = check_installed('Java(TM) SE Development Kit 17*') | trim == 'true' %}
{% set pkg = 'jdk-'~ version ~'.exe' %}
{% set exists = salt['file.file_exists'](downloads + '\\jdk17\\' + pkg) %}

{% if not installed %}
{% if exists %}

jdk17-offline:
  cmd.run:
    - name: '{{ pkg }} /s'
    - shell: cmd
    - cwd: '{{ downloads }}\jdk17'

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}

{% else %}
JDK17 is already installed:
  test.nop
{% endif %}
