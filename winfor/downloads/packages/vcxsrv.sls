# Name: VcXsrv Windows X Server
# Website: https://github.com/marchaesen/vcxsrv
# Description: Windows X-Server for interacting with X-Windows environments
# Category: Utilities
# Author: Marha
# License: GNU General Public License v3 (https://github.com/marchaesen/vcxsrv/blob/master/COPYING)
# Version: 21.1.16.1
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '21.1.16.1' %}
{% set hash = 'df7fed8f49665d0592528ab6be9d07111ea73c6848283d128b77690e05b8f90b' %}

vcxsrv-download-only:
  file.managed:
    - name: '{{ downloads }}\vcxsrv\vcxsrv-64.{{ version }}.installer.exe'
    - source: https://github.com/marchaesen/vcxsrv/releases/download/{{ version }}/vcxsrv-64.{{ version }}.installer.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
