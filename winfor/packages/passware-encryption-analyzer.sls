# Name: 
# Website: 
# Description: 
# Category: 
# Author: 
# License: 
# Version: 2022.3.1.3215
# Notes:

{% set new_version = '2022.3.1.3215' %}
{% set current_version = salt['pkg.version']('passware-encryption-analyzer') %}

{% if current_version == new_version %}

Passware Encryption Analyzer is already at the latest version:
  test.nop

{% elif current_version == '' %}

passware-encryption-analyzer-{{ new_version }}:
  pkg.installed:
    - name: passware-encryption-analyzer

{% else %}

remove-previous-passware-version:
  pkg.removed:
    - name: passware-encryption-analyzer

passware-encryption-analyzer:
  pkg.installed:
    - require:
      - pkg: remove-previous-passware-version

{% endif %}
