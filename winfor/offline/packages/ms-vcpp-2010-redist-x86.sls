# Name: Microsoft VC++ 2010 Redistributable
# Website: https://microsoft.com
# Description: Microsoft Visual C++ 2010 Redistributable
# Category: Requirements
# Author: Microsoft
# License: EULA
# Version: 10.0.40219
# Notes:

{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set version = '10.0.40219' %}
{% from 'winfor/_macros/is_installed.jinja' import check_installed %}
{% set installed = check_installed('Microsoft Visual C++ *' + ".".join(version.split(".")[:3])) | trim == 'true' %}
{% set pkg = 'ms-vcpp-2010-redist-x86-'~ version ~'.exe' %}
{% set exists = salt['file.file_exists'](downloads + '\\ms-vcpp\\' + pkg) %}

{% if not installed %}
{% if exists %}
ms-vcpp-2010-redist-x86-offline:
  cmd.run:
    - name: '{{ pkg }} /q /norestart'
    - shell: cmd
    - cwd: '{{ downloads }}\ms-vcpp'

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
{% else %}
Microsoft VC++ 2010 Redistributable {{ version }} is already installed:
  test.nop
{% endif %}
