# Name: VcXsrv Windows X Server
# Website: https://sourceforge.net/projects/vcxsrv
# Description: Windows X-Server for interacting with X-Windows environments
# Category: Utilities
# Author: Marha
# License: GNU General Public License v3 (https://sourceforge.net/p/vcxsrv/code/ci/master/tree/COPYING)
# Version: 21.1.13.0
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '21.1.13.0' %}
{% set hash = '970243B0E2C652949225D250BF37E87E2F321435D4D3757E94FF762E4578A281' %}

vcxsrv-download-only:
  file.managed:
    - name: '{{ downloads }}\vcxsrv\vcxsrv-64.{{ version }}.installer.exe'
    - source: https://github.com/marchaesen/vcxsrv/releases/download/{{ version.split(".")[:-1] | join(".") }}/vcxsrv-64.{{ version }}.installer.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
