# Name: ilspy
# Website: https://github.com/icsharpcode/ilspy
# Description: .NET Decompiler
# Category: Executables
# Author: ICSharpCode (https://github.com/orgs/icsharpcode/people)
# License: MIT License (https://github.com/icsharpcode/ILSpy/blob/master/doc/ILSpyAboutPage.txt)
# Version: 11.1.0.9782
# Notes:

{% set version = '11.1.0.9782' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('ilspy') %}

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
