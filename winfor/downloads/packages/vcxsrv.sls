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
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('vcxsrv') %}

vcxsrv-download-only:
  file.managed:
    - name: '{{ downloads }}\vcxsrv\vcxsrv-{{ version }}.exe'
    - source: https://github.com/marchaesen/vcxsrv/releases/download/{{ version }}/vcxsrv-64.{{ version }}.installer.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
