# Name: ilspy
# Website: https://github.com/icsharpcode/ilspy
# Description: .NET Decompiler
# Category: Executables
# Author: ICSharpCode (https://github.com/orgs/icsharpcode/people)
# License: MIT License (https://github.com/icsharpcode/ILSpy/blob/master/doc/ILSpyAboutPage.txt)
# Version: 7.2.1.6856
# Notes:

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set version = '7.2.1.6856' %}
{% set core_version = '7.2.1' %}
{% set hash = '8da077031a6075f5cb5edc2ce8b40cd8ac6e3d9b9c57e900277282fae41d887a' %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

ilspy-download:
  file.managed:
    - name: 'C:\salt\tempdownload\ILSpy_binaries_{{ version }}.zip'
    - source: https://github.com/icsharpcode/ILSpy/releases/download/v{{ core_version }}/ILSpy_binaries_{{ version }}.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

ilspy-extract:
  archive.extracted:
    - name: '{{ inpath }}\ilspy\'
    - source: 'C:\salt\tempdownload\ILSpy_binaries_{{ version }}.zip'
    - enforce_toplevel: False
    - require:
      - file: ilspy-download

winfor-standalones-ilspy-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\ILSpy.lnk'
    - target: '{{ inpath }}\ilspy\ILSpy.exe'
    - force: True
    - working_dir: '{{ inpath }}\ilspy\'
    - makedirs: True
    - require:
      - file: ilspy-download
      - archive: ilspy-extract

ilspy-env-vars:
  win_path.exists:
    - name: '{{ inpath }}\ilspy\'
