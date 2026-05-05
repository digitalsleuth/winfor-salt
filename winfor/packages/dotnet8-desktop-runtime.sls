# Name: .NET 8 Desktop Runtime
# Website: https://microsoft.com
# Description: Windows Runtime component
# Category: Requirements
# Author: Microsoft
# License: EULA
# Version: 8.0.16.34817
# Notes:

{% from 'winfor/_macros/is_installed.jinja' import check_installed %}
{% set installed = check_installed('Microsoft Windows Desktop Runtime - 8*(x64)') | trim == 'true' %}

include:
  - winfor.repos

{% if installed %}

dotnet8-desktop-runtime-already-installed:
  test.nop

{% else %}

dotnet8-desktop-runtime:
  pkg.installed

{% endif %}
