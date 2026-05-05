# Name: .NET 6 Desktop Runtime
# Website: https://microsoft.com
# Description: Windows Runtime component
# Category: Requirements
# Author: Microsoft
# License: EULA
# Version: 6.0.36.34217
# Notes:

{% from 'winfor/_macros/is_installed.jinja' import check_installed %}
{% set installed = check_installed('Microsoft Windows Desktop Runtime - 6*(x64)') | trim == 'true' %}

include:
  - winfor.repos

{% if installed %}

dotnet6-desktop-runtime-already-installed:
  test.nop

{% else %}

dotnet6-desktop-runtime:
  pkg.installed

{% endif %}
