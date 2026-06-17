# Name: Git for Windows
# Website: https://github.com/git-for-windows/git
# Description: Version Control System for Windows
# Category: Requirements
# Author: Git (git-scm.com)
# License: GNU Public License and Lesser GNU Public License (https://github.com/git-for-windows/git/blob/main/COPYING, https://github.com/git-for-windows/git/blob/main/LGPL-2.1)
# Version: 2.38.1
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '2.38.1' %}
{% set hash = 'f3fe05e65cd7e9a9126784d4ad57fdf979d30d5987fe849af4348dbe3e284df6' %}

git-download-only:
  file.managed:
    - name: '{{ downloads }}\git\Git-{{ version }}-64-bit.exe'
    - source: https://github.com/git-for-windows/git/releases/download/v{{ version }}.windows.1/Git-{{ version }}-64-bit.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
