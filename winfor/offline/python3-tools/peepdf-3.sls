# Name: peepdf-3
# Website: https://github.com/digitalsleuth/peepdf-3
# Description: PDF analysis and malicious code analyzer.
# Category: Documents / Editors
# Author: Jose Miguel Esparza and Corey Forman
# License: GNU General Public License (GPL) v3: https://github.com/digitalsleuth/peepdf-3/blob/main/COPYING
# Version: 5.3.0
# Notes:

{% set version = '5.3.0' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'peepdf_3-'~ version ~'-py3-none-any.whl' %}
{% set exists = salt['file.file_exists'](downloads + '\\peepdf-3\\packages\\' + pkg) %}

{% if exists %}

include:
  - winfor.offline.packages.python3

peepdf-3-install-offline:
  cmd.run:
    - name: '"C:\Program Files\Python310\python.exe" -m pip install --no-index --find-links=.\packages peepdf-3'
    - cwd: '{{ downloads }}\peepdf-3\'
    - require:
      - sls: winfor.offline.packages.python3

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
