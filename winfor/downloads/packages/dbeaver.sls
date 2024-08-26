# Name: dbeaver
# Website: https://github.com/dbeaver/dbeaver
# Description: SQL Database tool and client
# Category: Databases
# Author: Serge Rider and Contributors (https://github.com/dbeaver/dbeaver/graphs/contributors)
# License: Apache License 2.0 (https://github.com/dbeaver/dbeaver/blob/devel/LICENSE.md)
# Version: 24.0.5
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '24.0.5' %}
{% set hash = 'c3fe662a9dc074a41ef3450235c421dae4c8046751e3268c445cd3b726927290' %}

dbeaver-download-only:
  file.managed:
    - name: '{{ downloads }}\dbeaver\dbeaver-ce-{{ version }}-x86_64-setup.exe'
    - source: https://github.com/dbeaver/dbeaver/releases/download/{{ version }}/dbeaver-ce-{{ version }}-x86_64-setup.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
