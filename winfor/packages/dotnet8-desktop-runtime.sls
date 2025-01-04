# Name: .NET 8 Desktop Runtime
# Website: https://microsoft.com
# Description: Windows Runtime component
# Category: Requirements
# Author: Microsoft
# License: EULA
# Version: 8.0.11.34221
# Notes:

{% set installed = salt['cmd.run']('powershell -c "(Get-ItemProperty HKLM:\\Software\Microsoft\\Windows\\CurrentVersion\\Uninstall\\* | Where-Object {$_.DisplayName -clike \'Microsoft Windows Desktop Runtime - 8*(x64)\' } | Select-Object -ExpandProperty DisplayVersion)"') %}

include:
  - winfor.repos

{% if installed %}

dotnet8-desktop-runtime-already-installed:
  test.nop

{% else %}

dotnet8-desktop-runtime:
  pkg.installed

{% endif %}
