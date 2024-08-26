# Name: VcXsrv Windows X Server
# Website: https://sourceforge.net/projects/vcxsrv
# Description: Windows X-Server for interacting with X-Windows environments
# Category: Utilities
# Author: Marha
# License: GNU General Public License v3 (https://sourceforge.net/p/vcxsrv/code/ci/master/tree/COPYING)
# Version: 1.20.14.0
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '1.20.14.0' %}
{% set hash = '7a5cd7d9d0ac982f09c8a93051fc48ab072fcc4b52237d1b91494363b9dad27e' %}

vcxsrv-download-only:
  file.managed:
    - name: '{{ downloads }}\vcxsrv\vcxsrv-64.{{ version }}.installer.exe'
    - source: https://versaweb.dl.sourceforge.net/project/vcxsrv/vcxsrv/{{ version }}/vcxsrv-64.{{ version }}.installer.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
