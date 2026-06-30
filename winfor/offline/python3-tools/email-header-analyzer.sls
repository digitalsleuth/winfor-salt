# Name: Email Header Analyzer
# Website: https://github.com/cyberdefenders/email-header-analyzer
# Description: Python-based Email Header Analysis Tool
# Category: Email
# Author: Ahmed Shawky (lnxg33k)
# License: GNU General Public License v3.0 (https://github.com/cyberdefenders/email-header-analyzer/blob/master/LICENSE.md)
# Version: v1
# Notes:

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set pkg = 'mha\\server.py' %}
{% set exists = salt['file.file_exists'](downloads + '\\email-header-analyzer\\' + pkg) %}

{% if exists %}

email-header-analyzer-copy-offline:
  file.copy:
    - name: '{{ inpath }}\email-header-analyzer'
    - source: '{{ downloads }}\email-header-analyzer'
    - recurse: True
    - force: True

email-header-analyzer-install-requirements-offline:
  cmd.run:
    - name: '"C:\Program Files\Python310\python.exe" -m pip install --no-index --find-links=.\packages -r requirements.txt'
    - cwd: '{{ inpath }}\email-header-analyzer'
    - require:
      - file: email-header-analyzer-copy-offline

email-header-analyzer-wrapper-offline:
  file.managed:
    - name: 'C:\Program Files\Python310\Scripts\email-header-analyzer.cmd'
    - win_inheritance: True
    - contents:
      - '@echo off'
      - 'python3 "{{ inpath }}\email-header-analyzer\mha\server.py" %*'

email-header-analyzer-shortcut-offline:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\Email Header Analyzer - Web Based.lnk'
    - target: 'C:\Program Files\Python310\Scripts\email-header-analyzer.cmd'
    - icon_location: 'C:\Windows\SystemResources\imageres.dll.mun, 15'
    - force: True
    - working_dir: 'C:\Program Files\Python310\Scripts\'
    - makedirs: True
    - require:
      - cmd: email-header-analyzer-install-requirements-offline
      - file: email-header-analyzer-wrapper-offline

{% else %}
{{ pkg }} does not exist - not installing Email Header Analyzer:
  test.nop
{% endif %}
