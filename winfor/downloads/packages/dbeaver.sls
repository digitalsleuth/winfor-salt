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
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('dbeaver') %}

dbeaver-download-only:
  file.managed:
    - name: '{{ downloads }}\dbeaver\dbeaver-{{ version }}.exe'
    - source: https://github.com/dbeaver/dbeaver/releases/download/{{ version }}/dbeaver-ce-{{ version }}-windows-x86_64.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
