# Name: Email Header Analyzer
# Website: https://github.com/cyberdefenders/email-header-analyzer
# Description: Python-based Email Header Analysis Tool
# Category: Email
# Author: Ahmed Shawky (lnxg33k)
# License: GNU General Public License v3.0 (https://github.com/cyberdefenders/email-header-analyzer/blob/master/LICENSE.md)
# Version: v1
# Notes:

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

include:
  - winfor.packages.git
  - winfor.standalones.portable-python3

email-header-analyzer-git-download-only:
  git.latest:
    - name: https://github.com/cyberdefenders/email-header-analyzer.git
    - target: '{{ downloads }}\email-header-analyzer'
    - rev: master
    - force_clone: True
    - force_reset: True
    - require:
      - sls: winfor.packages.git

email-header-analyzer-requirements-download-only:
  cmd.run:
    - name: '{{ inpath }}\portable-python3\python.exe -m pip download -r requirements.txt -d packages'
    - cwd: '{{ downloads }}\email-header-analyzer'
    - require:
      - git: email-header-analyzer-git-download-only
      - sls: winfor.standalones.portable-python3
