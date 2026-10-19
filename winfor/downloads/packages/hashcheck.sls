# Name: HashCheck
# Website: https://github.com/gurnec/HashCheck
# Description: Context-Menu / Shell Extension hash generator utility
# Category: Utilities
# Author: Christopher Gurnee / Kai Liu / David B. Trout / Tim Schlueter
# License: https://github.com/gurnec/HashCheck/blob/master/license.txt
# Version: 2.4.0.55
# Notes:

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '2.4.0' %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('hashcheck') %}

hashcheck-download-only:
  file.managed:
    - name: '{{ downloads }}\hashcheck\hashcheck-{{ version }}.exe'
    - source: https://github.com/gurnec/HashCheck/releases/download/v{{ version }}/HashCheckSetup-v{{ version }}.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
