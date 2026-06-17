# Name: NAFT - Network Appliance Forensic Toolkit
# Website: https://github.com/digitalsleuth/naft
# Description: Updated version of Didier Stevens Network Appliance memory dump analyzer
# Category: Network
# Author: Corey Forman / Gabriel Cossette / Didier Stevens
# License: MIT License (https://github.com/digitalsleuth/naft/blob/main/LICENSE.md)
# Version: 1.0.0b1
# Notes: 

{% set version = '1.0.0b1' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}

include:
  - winfor.offline.packages.python3
  - winfor.offline.python3-tools.python-dateutil

naft-install-offline:
  pip.installed:
    - name: '{{ downloads }}\naft\'
    - bin_env: 'C:\Program Files\Python310\python.exe'
    - require:
      - sls: winfor.offline.packages.python3
      - sls: winfor.offline.python3-tools.python-dateutil
