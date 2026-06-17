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
{% from 'winfor/_macros/is_installed.jinja' import check_installed %}
{% set installed = check_installed('Microsoft Windows Desktop Runtime - 8*(x64)') | trim == 'true' %}

{% if not installed %}

dotnet8-desktop-runtime-offline:
  cmd.run:
    - name: 'windowsdesktop-runtime-{{ version }}-win-x64.exe /quiet /norestart'
    - cwd: '{{ downloads }}\dotnet8-desktop-runtime'

{% else %}
".NET 8 Desktop Runtime is already installed":
  test.nop
{% endif %}
