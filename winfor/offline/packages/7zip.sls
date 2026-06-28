# Name: 7-Zip
# Website: https://7-zip.org
# Description: Zip Compiler and Extractor
# Category: Requirements
# Author: Igor Pavlov
# License: GNU LGPL (https://www.7-zip.org/faq.html)
# Version: 24.06
# Notes: 

{% set version = '2406' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = '7z-'~ version ~'.msi' %}
{% set exists = salt['file.file_exists'](downloads + '\\7zip\\' + pkg) %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set exes = ['7z', '7zFM', '7zG'] %}
{% from 'winfor/_macros/is_installed.jinja' import check_installed %}
{% set installed = check_installed('7-Zip') | trim == 'true' %}

include:
  - winfor.config.shims

{% if not installed %}
{% if exists %}
7zip-offline:
  cmd.run:
    - name: 'msiexec /i {{ pkg }} /qn /norestart'
    - shell: cmd
    - cwd: '{{ downloads }}\7zip'

{% for exe in exes %}
{{ exe }}-shim-offline:
  cmd.run:
    - name: 'powershell -nop -ep Bypass -File {{ inpath }}\New-Shim.ps1 -SourceExe "C:\\Program Files\\7-Zip\\{{ exe }}.exe" -OutPath {{ inpath }}\shims\{{ exe }}.exe'
    - require:
      - sls: winfor.config.shims
      - cmd: 7zip-offline
{% endfor %}

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}

{% else %}
7-Zip is already installed:
  test.nop
{% endif %}
