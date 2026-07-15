# Name: .NET 10 Desktop Runtime
# Website: https://microsoft.com
# Description: Windows Runtime component
# Category: Requirements
# Author: Microsoft
# License: EULA
# Version: 10.0.7.50000
# Notes:

{% set version = '10.0.7' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'dotnet10-desktop-runtime-'~ version ~'.exe' %}
{% set exists = salt['file.file_exists'](downloads + '\\dotnet10-desktop-runtime\\' + pkg) %}
{% from 'winfor/_macros/is_installed.jinja' import check_installed %}
{% set installed = check_installed('Microsoft Windows Desktop Runtime - 10*(x64)') | trim == 'true' %}

{% if not installed %}
{% if exists %}

dotnet10-desktop-runtime-offline:
  cmd.run:
    - name: '{{ pkg }} /quiet /norestart'
    - shell: cmd
    - cwd: '{{ downloads }}\dotnet10-desktop-runtime'

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
{% else %}
".NET 10 Desktop Runtime is already installed":
  test.nop
{% endif %}
