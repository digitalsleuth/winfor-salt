# Name: Passware Encryption Analyzer
# Website: https://www.passware.com
# Description: Encryption Analysis tool
# Category: Raw Parsers / Decoders
# Author: Passware - Dmitry Sumin
# License: EULA - https://www.passware.com/files/Passware-EULA.pdf
# Version: 2026.1.0.4992
# Notes: 

{% set version = '2026.1.0.4992' %}
{% set pkg = 'passware-encryption-analyzer' %}
{% macro passware_version_check(pkg_name, expected_version) %}
$v = (C:\Program` Files\Salt` Project\Salt\salt-call.exe --local pkg.version {{ pkg_name }} --out json | ConvertFrom-Json).local;
if ($v -eq '{{ expected_version }}') { 'already installed' } else { '' }
{% endmacro %}

include:
  - winfor.repos

Remove outdated Passware:
  pkg.removed:
    - name: {{ pkg }}
    - unless:
      - fun: cmd.run
        cmd: {{ passware_version_check(pkg, version) | indent(10) }}
        shell: powershell
        python_shell: True

saltutil.clear_cache:
  module.run:
    - require:
      - pkg: Remove outdated Passware

Install Passware {{ version }}:
  pkg.installed:
    - name: {{ pkg }}
    - version: {{ version }}
    - require:
      - module: saltutil.clear_cache
