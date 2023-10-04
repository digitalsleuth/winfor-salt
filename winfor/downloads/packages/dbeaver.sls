# Name: dbeaver
# Website: https://github.com/dbeaver/dbeaver
# Description: SQL Database tool and client
# Category: Databases
# Author: Serge Rider and Contributors (https://github.com/dbeaver/dbeaver/graphs/contributors)
# License: Apache License 2.0 (https://github.com/dbeaver/dbeaver/blob/devel/LICENSE.md)
# Version: 23.2.1
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '23.2.1' %}
{% set hash = '842186132afcc2da524a381e0d96399d9af2657862bcf3d9351689dd1f3e7ed4' %}

dbeaver-download-only:
  file.managed:
    - name: '{{ downloads }}\dbeaver-ce-{{ version }}-x86_64-setup.exe'
    - source: https://github.com/dbeaver/dbeaver/releases/download/{{ version }}/dbeaver-ce-{{ version }}-x86_64-setup.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
