# Name: .NET 9 Desktop Runtime
# Website: https://microsoft.com
# Description: Windows Runtime component
# Category: Requirements
# Author: Microsoft
# License: EULA
# Version: 9.0.5.34816
# Notes:

{% set version = '9.0.5' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'dotnet9-desktop-runtime-'~ version ~'.exe' %}
{% set exists = salt['file.file_exists'](downloads + '\\dotnet9-desktop-runtime\\' + pkg) %}
{% from 'winfor/_macros/is_installed.jinja' import check_installed %}
{% set installed = check_installed('Microsoft Windows Desktop Runtime - 9*(x64)') | trim == 'true' %}

{% if not installed %}
{% if exists %}

dotnet9-desktop-runtime-offline:
  cmd.run:
    - name: '{{ pkg }} /quiet /norestart'
    - cwd: '{{ downloads }}\dotnet9-desktop-runtime'

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
{% else %}
".NET 9 Desktop Runtime is already installed":
  test.nop
{% endif %}
