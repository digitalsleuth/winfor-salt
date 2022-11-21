{% set installed = salt['cmd.run']('powershell -c "(Get-ItemProperty HKLM:\\Software\Microsoft\\Windows\\CurrentVersion\\Uninstall\\* | Where-Object {$_.DisplayName -clike \'Microsoft Windows Desktop Runtime - 6*(x64)\' } | Select-Object -ExpandProperty DisplayVersion)"') %}
{% if installed %}

dotnet6-desktop-runtime-already-installed:
  test.nop

{% else %}

dotnet6-desktop-runtime:
  pkg.installed

{% endif %}
