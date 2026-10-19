# Name: Git for Windows
# Website: https://github.com/git-for-windows/git
# Description: Version Control System for Windows
# Category: Requirements
# Author: Git (git-scm.com)
# License: GNU Public License and Lesser GNU Public License (https://github.com/git-for-windows/git/blob/main/COPYING, https://github.com/git-for-windows/git/blob/main/LGPL-2.1)
# Version: 2.49.0
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '2.49.0' %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('git') %}

git-download-only:
  file.managed:
    - name: '{{ downloads }}\git\git-{{ version }}.exe'
    - source: https://github.com/git-for-windows/git/releases/download/v{{ version }}.windows.1/Git-{{ version }}-64-bit.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
