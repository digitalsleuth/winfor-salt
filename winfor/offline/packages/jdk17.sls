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

{% if not installed %}

jdk17-offline:
  cmd.run:
    - name: 'jdk-{{ version }}_windows-x64_bin.exe /s'
    - cwd: '{{ downloads }}\jdk17'

{% else %}
"JDK17 is already installed":
  test.nop
{% endif %}
