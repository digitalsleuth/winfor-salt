# Name: ilspy
# Website: https://github.com/icsharpcode/ilspy
# Description: .NET Decompiler
# Category: Executables
# Author: ICSharpCode (https://github.com/orgs/icsharpcode/people)
# License: MIT License (https://github.com/icsharpcode/ILSpy/blob/master/doc/ILSpyAboutPage.txt)
# Version: 10.1.1
# Notes:

{% set version = '10.1.1' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set hash = '347ccff812f4c4e2f29652edbede8077cf563a7213c34d5aa783d0388733fb45' %}

include:
  - winfor.downloads.packages.dotnet10-desktop-runtime

ilspy-download-only:
  file.managed:
    - name: '{{ downloads }}\ilspy\ilspy-{{ version }}.msi'
    - source: https://github.com/icsharpcode/ILSpy/releases/download/v{{ '.'.join(version.split('.')[:2]) }}/ILSpy_Installer_{{ version }}-x64.msi
    - source_hash: sha256={{ hash }}
    - makedirs: True
    - require:
      - sls: winfor.downloads.packages.dotnet10-desktop-runtime
