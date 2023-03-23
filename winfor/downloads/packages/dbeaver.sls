# Name: dbeaver
# Website: https://github.com/dbeaver/dbeaver
# Description: SQL Database tool and client
# Category: Databases
# Author: Serge Rider and Contributors (https://github.com/dbeaver/dbeaver/graphs/contributors)
# License: Apache License 2.0 (https://github.com/dbeaver/dbeaver/blob/devel/LICENSE.md)
# Version: 22.2.5
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '22.2.5' %}
{% set hash = '0706418c965016c766c3a7a4d0b97d63d7b8717043b967d320cdf5498c0a81f6' %}

dbeaver-download-only:
  file.managed:
    - name: '{{ downloads }}\dbeaver-ce-{{ version }}-x86_64-setup.exe'
    - source: https://github.com/dbeaver/dbeaver/releases/download/{{ version }}/dbeaver-ce-{{ version }}-x86_64-setup.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
