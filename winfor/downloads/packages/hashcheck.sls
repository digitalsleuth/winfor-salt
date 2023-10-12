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
{% set hash = '2d6067f00bbb93526d146d2228a46dc4851f0fa866e69250279c6b2f00b8f1b7' %}

hashcheck-download-only:
  file.managed:
    - name: '{{ downloads }}\hashcheck\HashCheckSetup-v{{ version }}.exe'
    - source: https://github.com/gurnec/HashCheck/releases/download/v{{ version }}/HashCheckSetup-v{{ version }}.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
