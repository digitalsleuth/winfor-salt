# Name: dbeaver
# Website: https://github.com/dbeaver/dbeaver
# Description: SQL Database tool and client
# Category: Databases
# Author: Serge Rider and Contributors (https://github.com/dbeaver/dbeaver/graphs/contributors)
# License: Apache License 2.0 (https://github.com/dbeaver/dbeaver/blob/devel/LICENSE.md)
# Version: 26.2.3
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '26.2.3' %}
{% set hash = '49d0c6d4ee0ba5acecfb48b9a4d2bd8d5734730154d5b974d8990205edb8e927' %}

dbeaver-download-only:
  file.managed:
    - name: '{{ downloads }}\dbeaver\dbeaver-{{ version }}.exe'
    - source: https://github.com/dbeaver/dbeaver/releases/download/{{ version }}/dbeaver-ce-{{ version }}-windows-x86_64.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
