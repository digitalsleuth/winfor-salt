# Name: Microsoft PowerToys
# Website: https://github.com/microsoft/powertoys
# Description: Windows productivity system utilities
# Category: Utilities
# Author: Microsoft
# License: MIT (https://github.com/microsoft/PowerToys/blob/main/LICENSE)
# Version: 0.102.3001.0
# Notes:

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '0.102.3001.0' %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('ms-powertoys') %}
{% if version_split | length == 4 %}
  {% set tag = ".".join(version_split[:3]) %}
{% else %}
  {% set tag = version %}
{% endif %}

ms-powertoys-download-only:
  file.managed:
    - name: '{{ downloads }}\powertoys\powertoys-{{ version }}.exe'
    - source: https://github.com/microsoft/PowerToys/releases/download/v{{ tag }}/PowerToysSetup-{{ version }}-x64.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
