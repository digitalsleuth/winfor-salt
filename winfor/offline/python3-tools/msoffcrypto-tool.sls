# Name: msoffcrypto-tool
# Website: https://github.com/nolze/msoffcrypto-tool
# Description: Python library for decrypting encrypted MS Office Files
# Category: Documents / Editors
# Author: Nolze
# License: MIT License (https://github.com/nolze/msoffcrypto-tool/blob/master/LICENSE.txt)
# Version: 6.0.0
# Notes: 

{% set version = '6.0.0' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'msoffcrypto_tool-'~ version ~'-py3-none-any.whl' %}
{% set exists = salt['file.file_exists'](downloads + '\\msoffcrypto-tool\\packages\\' + pkg) %}

{% if exists %}

include:
  - winfor.offline.packages.python3

msoffcrypto-tool-install-offline:
  cmd.run:
    - name: '"C:\Program Files\Python310\python.exe" -m pip install --no-index --find-links=.\packages msoffcrypto-tool'
    - cwd: '{{ downloads }}\msoffcrypto-tool\'
    - require:
      - sls: winfor.offline.packages.python3

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
