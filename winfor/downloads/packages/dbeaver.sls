# Name: dbeaver
# Website: https://github.com/dbeaver/dbeaver
# Description: SQL Database tool and client
# Category: Databases
# Author: Serge Rider and Contributors (https://github.com/dbeaver/dbeaver/graphs/contributors)
# License: Apache License 2.0 (https://github.com/dbeaver/dbeaver/blob/devel/LICENSE.md)
# Version: 25.2.4
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '25.2.4' %}
{% set hash = '83b0170ed788399765d89e62be3022f055753297084c83583392110f6c5fa451' %}

dbeaver-download-only:
  file.managed:
    - name: '{{ downloads }}\dbeaver\dbeaver-ce-{{ version }}-x86_64-setup.exe'
    - source: https://github.com/dbeaver/dbeaver/releases/download/{{ version }}/dbeaver-ce-{{ version }}-x86_64-setup.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
