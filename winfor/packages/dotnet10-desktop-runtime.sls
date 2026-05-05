# Name: .NET 10 Desktop Runtime
# Website: https://microsoft.com
# Description: Windows Runtime component
# Category: Requirements
# Author: Microsoft
# License: EULA
# Version: 10.0.7.50000
# Notes:

{% from 'winfor/_macros/is_installed.jinja' import check_installed %}
{% set installed = check_installed('Microsoft Windows Desktop Runtime - 10*(x64)') | trim == 'true' %}

include:
  - winfor.repos

{% if installed %}

dotnet10-desktop-runtime-already-installed:
  test.nop

{% else %}

dotnet10-desktop-runtime:
  pkg.installed

{% endif %}
