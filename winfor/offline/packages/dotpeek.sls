# Name: dotPeek
# Website: https://www.jetbrains.com
# Description: .NET Decompiler and Assembly Browser
# Category: Executables
# Author: JetBrains
# License: EULA (https://www.jetbrains.com/legal/docs/toolbox/license_personal/)
# Version: 2026.1.2
# Notes: 

{% set version = '2026.1.2' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set pkg = 'dotpeek-'~ version ~'.exe' %}
{% set exists = salt['file.file_exists'](downloads + '\\dotpeek\\' + pkg) %}
{% set PROGRAMDATA = salt['environ.get']("PROGRAMDATA") %}

{% if exists %}
dotpeek-install-offline:
  file.managed:
    - name: '{{ inpath }}\dotpeek\dotPeek64.exe'
    - source: '{{ downloads }}\dotpeek\{{ pkg }}'
    - makedirs: True

dotpeek-shortcut-offline:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\dotPeek64.lnk'
    - target: '{{ inpath }}\dotpeek\dotPeek64.exe'
    - force: True
    - working_dir: '{{ inpath }}\dotpeek\'
    - makedirs: True
    - require:
      - file: dotpeek-install-offline
{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
