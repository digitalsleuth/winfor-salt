# Name: 
# Website: 
# Description: 
# Category: 
# Author: 
# License: 
# Version: 2022.3.1.3215
# Notes:

{% set version = '2022.3.1.3215' %}
{% set pkg_installed = salt['cmd.run']('Test-Path -Path "HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Uninstall\\{64ACEB50-F033-4CF9-840D-90FA17769421}\"', shell="powershell") %}
{% if pkg_installed == "True" %}
passware-encryption-analyzer-is-installed:
  test.nop
  {% set pkg_version = salt['cmd.run']('Get-ItemProperty -Path "HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Uninstall\\{64ACEB50-F033-4CF9-840D-90FA17769421}\" | Select -exp DisplayVersion', shell="powershell") %}
  {% if pkg_version == version %}
passware-is-at-version-{{ pkg_version }}:
  test.nop
  {% else %}
passware-is-out-of-date:
  pkg.removed:
    - name: passware-encryption-analyzer

passware-encryption-analyzer-{{ pkg_version }}:
  pkg.installed:
    - name: passware-encryption-analyzer
    - require:
      - pkg: passware-is-out-of-date
{% endif %}
{% else %}
passware-encryption-analyzer-is-not-installed:
  pkg.installed:
    - name: passware-encryption-analyzer
{% endif %}
