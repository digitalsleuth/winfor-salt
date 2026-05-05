# Name: .NET 9 Desktop Runtime
# Website: https://microsoft.com
# Description: Windows Runtime component
# Category: Requirements
# Author: Microsoft
# License: EULA
# Version: 9.0.5.34816
# Notes:

{% from 'winfor/_macros/is_installed.jinja' import check_installed %}
{% set installed = check_installed('Microsoft Windows Desktop Runtime - 9*(x64)') | trim == 'true' %}

include:
  - winfor.repos

{% if installed %}

dotnet9-desktop-runtime-already-installed:
  test.nop

{% else %}

dotnet9-desktop-runtime:
  pkg.installed

{% endif %}
