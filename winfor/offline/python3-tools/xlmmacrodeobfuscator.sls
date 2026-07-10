# Name: XLMMacroDeobfuscator
# Website: https://github.com/DissectMalware/XLMMacroDeobfuscator
# Description: Decode obfuscated XLM macros (aka Excel v4.0 macros)
# Category: Documents / Editors
# Author: Malwrologist / DissectMalware
# License: Apache License v2.0 (https://github.com/DissectMalware/XLMMacroDeobfuscator/blob/master/LICENSE)
# Version: 0.2.7
# Notes: 

{% set version = '0.2.7' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'XLMMacroDeobfuscator-'~ version ~'-py3-none-any.whl' %}
{% set exists = salt['file.file_exists'](downloads + '\\xlmmacrodeobfuscator\\packages\\' + pkg) %}

{% if exists %}

include:
  - winfor.offline.packages.python3

xlmmacrodeobfuscator-install-offline:
  cmd.run:
    - name: '"C:\Program Files\Python310\python.exe" -m pip install --no-index --find-links=.\packages XLMMacroDeobfuscator'
    - cwd: '{{ downloads }}\xlmmacrodeobfuscator\'
    - require:
      - sls: winfor.offline.packages.python3

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
