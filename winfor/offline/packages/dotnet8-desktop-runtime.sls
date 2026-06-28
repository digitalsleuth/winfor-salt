# Name: .NET 8 Desktop Runtime
# Website: https://microsoft.com
# Description: Windows Runtime component
# Category: Requirements
# Author: Microsoft
# License: EULA
# Version: 8.0.16.34817
# Notes:

{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set version = '8.0.16' %}
{% set pkg = 'dotnet8-desktop-runtime-'~ version ~'.exe' %}
{% set exists = salt['file.file_exists'](downloads + '\\dotnet8-desktop-runtime\\' + pkg) %}
{% from 'winfor/_macros/is_installed.jinja' import check_installed %}
{% set installed = check_installed('Microsoft Windows Desktop Runtime - 8*(x64)') | trim == 'true' %}

{% if not installed %}
{% if exists %}

dotnet8-desktop-runtime-offline:
  cmd.run:
    - name: '{{ pkg }} /quiet /norestart'
    - shell: cmd
    - cwd: '{{ downloads }}\dotnet8-desktop-runtime'

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
{% else %}
".NET 8 Desktop Runtime is already installed":
  test.nop
{% endif %}
