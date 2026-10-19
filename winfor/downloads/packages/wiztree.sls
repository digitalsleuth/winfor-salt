# Name: WizTree
# Website: https://diskanalyzer.com/
# Description: Disk Space Analyzer tool
# Category: Utilities
# Author: Antibody Software
# License: EULA (https://diskanalyzer.com/eula)
# Version: 4.31
# Notes:

{% set version = '4.31' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('wiztree') %}

wiztree-download-only:
  file.managed:
    - name: '{{ downloads }}\wiztree\wiztree-{{ version }}.exe'
    - source: https://diskanalyzer.com/files/wiztree_{{ version | replace('.','_') }}_setup.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
