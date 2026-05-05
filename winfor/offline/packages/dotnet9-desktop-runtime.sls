# Name: .NET 9 Desktop Runtime
# Website: https://microsoft.com
# Description: Windows Runtime component
# Category: Requirements
# Author: Microsoft
# License: EULA
# Version: 9.0.5.34816
# Notes:

{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set version = '9.0.5' %}
{% from 'winfor/_macros/is_installed.jinja' import check_installed %}
{% set installed = check_installed('Microsoft Windows Desktop Runtime - 9*(x64)') | trim == 'true' %}

{% if not installed %}

dotnet9-desktop-runtime-offline:
  cmd.run:
    - name: 'windowsdesktop-runtime-{{ version }}-win-x64.exe /quiet /norestart'
    - cwd: '{{ downloads }}\dotnet9-desktop-runtime'
{% else %}
".NET 9 Desktop Runtime is already installed":
  test.nop
{% endif %}
