# Name: ilspy
# Website: https://github.com/icsharpcode/ilspy
# Description: .NET Decompiler
# Category: Executables
# Author: ICSharpCode (https://github.com/orgs/icsharpcode/people)
# License: MIT License (https://github.com/icsharpcode/ILSpy/blob/master/doc/ILSpyAboutPage.txt)
# Version: 8.1.1.7464
# Notes:

{% set version = '8.1.1.7464' %}
{% set core_version = '8.1.1' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set hash = 'a90663a304c50201d0517d89d3aa6bdbdbcd3b9e5ed5da03e6190ed2a0e9b138' %}

ilspy-download-only:
  file.managed:
    - name: '{{ downloads }}\ILSpy_Installer_{{ version }}-x64.msi'
    - source: https://github.com/icsharpcode/ILSpy/releases/download/v{{ core_version }}/ILSpy_Installer_{{ version }}-x64.msi
    - source_hash: sha256={{ hash }}
    - makedirs: True
