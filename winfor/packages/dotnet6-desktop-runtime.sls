{% if salt['pkg.version']('Microsoft Windows Desktop Runtime - 6.0.10 (x64)') %}

dotnet6-desktop-runtime-6-0-10-already-installed:
  test.nop

{% elif salt['pkg.version']('Microsoft Windows Desktop Runtime - 6.0.7 (x64)') %}

dotnet6-desktop-runtime-6-0-7-already-installed:
  test.nop

{% else %}

dotnet6-desktop-runtime:
  pkg.installed

{% endif %}
