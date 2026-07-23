# Name: malwoverview
# Website: https://github.com/alexandreborges/malwoverview
# Description: Malware metadata lookup tool
# Category: Executables
# Author: Alexandre Borges
# License: GNU General Public License v3.0 (https://github.com/alexandreborges/malwoverview/blob/master/LICENSE)
# Version: 8.0.5
# Notes:

{% set version = '8.0.5' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'malwoverview-'~ version ~'-py3-none-any.whl' %}
{% set exists = salt['file.file_exists'](downloads + '\\malwoverview\\packages\\' + pkg) %}

{% if exists %}

include:
  - winfor.offline.packages.python3

malwoverview-install-offline:
  cmd.run:
    - name: '"C:\Program Files\Python310\python.exe" -m pip install --no-index --find-links=.\packages malwoverview'
    - shell: cmd
    - cwd: '{{ downloads }}\malwoverview\'
    - require:
      - sls: winfor.offline.packages.python3

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
