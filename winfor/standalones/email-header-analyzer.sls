# Name: Email Header Analyzer
# Website: https://github.com/cyberdefenders/email-header-analyzer
# Description: Python-based Email Header Analysis Tool
# Category: Email
# Author: Ahmed Shawky (lnxg33k)
# License: GNU General Public License v3.0 (https://github.com/cyberdefenders/email-header-analyzer/blob/master/LICENSE.md)
# Version: v1
# Notes:

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

include:
  - winfor.packages.git
  - winfor.packages.python3

email-header-analyzer-git:
  git.latest:
    - name: https://github.com/cyberdefenders/email-header-analyzer.git
    - target: '{{ inpath }}\email-header-analyzer'
    - rev: master
    - force_clone: True
    - force_reset: True
    - require:
      - sls: winfor.packages.git

email-header-analyzer-install-requirements:
  pip.installed:
    - requirements: '{{ inpath }}\email-header-analyzer\requirements.txt'
    - bin_env: 'C:\Program Files\Python310\python.exe'
    - require:
      - sls: winfor.packages.python3

email-header-analyzer-wrapper:
  file.managed:
    - name: 'C:\Program Files\Python310\Scripts\email-header-analyzer.cmd'
    - win_inheritance: True
    - contents:
      - '@echo off'
      - 'python3 "{{ inpath }}\email-header-analyzer\mha\server.py" %*'

email-header-analyzer-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\Email Header Analyzer - Web Based.lnk'
    - target: 'C:\Program Files\Python310\Scripts\email-header-analyzer.cmd'
    - icon_location: 'C:\Windows\SystemResources\imageres.dll.mun, 15'
    - force: True
    - working_dir: 'C:\Program Files\Python310\Scripts\'
    - makedirs: True
    - require:
      - git: email-header-analyzer-git
      - pip: email-header-analyzer-install-requirements
      - file: email-header-analyzer-wrapper

