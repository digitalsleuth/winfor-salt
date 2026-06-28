# Name: ilspy
# Website: https://github.com/icsharpcode/ilspy
# Description: .NET Decompiler
# Category: Executables
# Author: ICSharpCode (https://github.com/orgs/icsharpcode/people)
# License: MIT License (https://github.com/icsharpcode/ILSpy/blob/master/doc/ILSpyAboutPage.txt)
# Version: 10.1.0.8386
# Notes:

{% set version = '10.1.0.8386' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'ilspy-'~ version ~'.msi' %}
{% set exists = salt['file.file_exists'](downloads + '\\ilspy\\' + pkg) %}

{% if exists %}
include:
  - winfor.offline.packages.dotnet10-desktop-runtime

ilspy-install-offline:
  cmd.run:
    - name: 'msiexec /i {{ pkg }} /qn ALLUSERS=1 /norestart'
    - shell: cmd
    - cwd: '{{ downloads }}\ilspy\'
    - require:
      - sls: winfor.offline.packages.dotnet10-desktop-runtime

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
