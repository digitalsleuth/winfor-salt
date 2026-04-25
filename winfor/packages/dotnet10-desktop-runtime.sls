# Name: .NET 10 Desktop Runtime
# Website: https://microsoft.com
# Description: Windows Runtime component
# Category: Requirements
# Author: Microsoft
# License: EULA
# Version: 10.0.7.50000
# Notes:

{% set installed = salt['cmd.run']('powershell -c "(Get-ItemProperty HKLM:\\Software\Microsoft\\Windows\\CurrentVersion\\Uninstall\\* | Where-Object {$_.DisplayName -clike \'Microsoft Windows Desktop Runtime - 10*(x64)\' } | Select-Object -ExpandProperty DisplayVersion)"') %}

include:
  - winfor.repos

{% if installed %}

dotnet10-desktop-runtime-already-installed:
  test.nop

{% else %}

dotnet10-desktop-runtime:
  pkg.installed

{% endif %}
