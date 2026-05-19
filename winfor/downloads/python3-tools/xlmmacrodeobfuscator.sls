# Name: XLMMacroDeobfuscator
# Website: https://github.com/DissectMalware/XLMMacroDeobfuscator
# Description: Decode obfuscated XLM macros (aka Excel v4.0 macros)
# Category: Documents / Editors
# Author: Malwrologist / DissectMalware
# License: Apache License v2.0 (https://github.com/DissectMalware/XLMMacroDeobfuscator/blob/master/LICENSE)
# Version: 0.2.7
# Notes:

{% set version = '0.2.7' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

include:
  - winfor.standalones.portable-python3

xlmmacrodeobfuscator-folder-download-only:
  file.directory:
    - name: '{{ downloads }}\xlmmacrodeobfuscator'
    - makedirs: True
    - force: True
    - win_inheritance: True

xlmmacrodeobfuscator-download-only:
  cmd.run:
    - name: '{{ inpath }}\portable-python3\python.exe -m pip download -d packages XLMMacroDeobfuscator'
    - cwd: '{{ downloads }}\xlmmacrodeobfuscator\'
    - require:
      - sls: winfor.standalones.portable-python3
      - file: xlmmacrodeobfuscator-folder-download-only
