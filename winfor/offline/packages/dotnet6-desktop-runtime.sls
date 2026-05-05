# Name: .NET 6 Desktop Runtime
# Website: https://microsoft.com
# Description: Windows Runtime component
# Category: Requirements
# Author: Microsoft
# License: EULA
# Version: 6.0.36.34217
# Notes:

{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set version = '6.0.36' %}
{% from 'winfor/_macros/is_installed.jinja' import check_installed %}
{% set installed = check_installed('Microsoft Windows Desktop Runtime - 6*(x64)') | trim == 'true' %}

{% if not installed %}
dotnet6-desktop-runtime-offline:
  cmd.run:
    - name: 'windowsdesktop-runtime-{{ version }}-win-x64.exe /quiet /norestart'
    - cwd: '{{ downloads }}\dotnet6-desktop-runtime'
{% else %}
".NET 6 Desktop Runtime is already installed":
  test.nop
{% endif %}
