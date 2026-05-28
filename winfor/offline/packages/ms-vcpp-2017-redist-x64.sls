# Name: Microsoft VC++ 2017+ Redistributable
# Website: https://microsoft.com
# Description: Microsoft Visual C++ 2017+ Redistributable
# Category: Requirements
# Author: Microsoft
# License: EULA
# Version: 14.44.35208.0
# Notes:

{% set version = '14.44.35208.0' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% from 'winfor/_macros/is_installed.jinja' import check_installed %}
{% set installed = check_installed('Microsoft Visual C++ *' + ".".join(version.split(".")[:3])) | trim == 'true' %}

{% if not installed %}

ms-vcpp-2017-redist-x64-offline:
  cmd.run:
    - name: 'vcpp-2017-redist-x64-{{ version }}.exe /quiet /norestart'
    - cwd: '{{ downloads }}\ms-vcpp'

{% else %}
"Microsoft VC++ 2017 Redistributable {{ version }} is already installed":
  test.nop
{% endif %}
