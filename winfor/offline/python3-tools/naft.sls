# Name: NAFT - Network Appliance Forensic Toolkit
# Website: https://github.com/digitalsleuth/naft
# Description: Updated version of Didier Stevens Network Appliance memory dump analyzer
# Category: Network
# Author: Corey Forman / Gabriel Cossette / Didier Stevens
# License: MIT License (https://github.com/digitalsleuth/naft/blob/main/LICENSE.md)
# Version: 1.0.2
# Notes: 

{% set version = '1.0.2' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'naft-'~ version ~'-py3-none-any.whl' %}
{% set exists = salt['file.file_exists'](downloads + '\\naft\\packages\\' + pkg) %}

{% if exists %}

include:
  - winfor.offline.packages.python3

naft-install-offline:
  cmd.run:
    - name: '"C:\Program Files\Python310\python.exe" -m pip install --no-index --find-links=.\packages naft'
    - cwd: '{{ downloads }}\naft\'
    - require:
      - sls: winfor.offline.packages.python3

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
