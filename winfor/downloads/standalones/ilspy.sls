# Name: ilspy
# Website: https://github.com/icsharpcode/ilspy
# Description: .NET Decompiler
# Category: Executables
# Author: ICSharpCode (https://github.com/orgs/icsharpcode/people)
# License: MIT License (https://github.com/icsharpcode/ILSpy/blob/master/doc/ILSpyAboutPage.txt)
# Version: 7.2.1.6856
# Notes:

{% set version = '7.2.1.6856' %}
{% set core_version = '7.2.1' %}
{% set hash = '8da077031a6075f5cb5edc2ce8b40cd8ac6e3d9b9c57e900277282fae41d887a' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

ilspy-download-only:
  file.managed:
    - name: '{{ downloads }}\ILSpy_binaries_{{ version }}.zip'
    - source: https://github.com/icsharpcode/ILSpy/releases/download/v{{ core_version }}/ILSpy_binaries_{{ version }}.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
