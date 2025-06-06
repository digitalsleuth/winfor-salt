# Name: dbeaver
# Website: https://github.com/dbeaver/dbeaver
# Description: SQL Database tool and client
# Category: Databases
# Author: Serge Rider and Contributors (https://github.com/dbeaver/dbeaver/graphs/contributors)
# License: Apache License 2.0 (https://github.com/dbeaver/dbeaver/blob/devel/LICENSE.md)
# Version: 25.0.1
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '25.0.1' %}
{% set hash = 'b5cdfbf70b0405773c20bf645071a035d1f69f8008e53b0f78cde5dc5c885ce8' %}

dbeaver-download-only:
  file.managed:
    - name: '{{ downloads }}\dbeaver\dbeaver-ce-{{ version }}-x86_64-setup.exe'
    - source: https://github.com/dbeaver/dbeaver/releases/download/{{ version }}/dbeaver-ce-{{ version }}-x86_64-setup.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
