# Name: .NET 9 Desktop Runtime
# Website: https://microsoft.com
# Description: Windows Runtime component
# Category: Requirements
# Author: Microsoft
# License: EULA
# Version: 9.0.5.34816
# Notes:

{% set installed = salt['cmd.run']('powershell -c "(Get-ItemProperty HKLM:\\Software\Microsoft\\Windows\\CurrentVersion\\Uninstall\\* | Where-Object {$_.DisplayName -clike \'Microsoft Windows Desktop Runtime - 9*(x64)\' } | Select-Object -ExpandProperty DisplayVersion)"') %}

include:
  - winfor.repos

{% if installed %}

dotnet9-desktop-runtime-already-installed:
  test.nop

{% else %}

dotnet9-desktop-runtime:
  pkg.installed

{% endif %}
