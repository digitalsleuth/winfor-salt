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
{% set current_installed = check_installed('Microsoft Visual C++ *' + ".".join(version.split(".")[:3])) | trim == 'true' %}
{% set newer_installed = check_installed('Microsoft Visual C++ 2015-2022 *') | trim == 'true' %}
{% set pkg = 'ms-vcpp-2017-redist-'~ version ~'.exe' %}
{% set exists = salt['file.file_exists'](downloads + '\\ms-vcpp\\' + pkg) %}

{% if not current_installed and not newer_installed %}
{% if exists %}

ms-vcpp-2017-redist-x64-offline:
  cmd.run:
    - name: 'vcpp-2017-redist-x64-{{ version }}.exe /quiet /norestart'
    - shell: cmd
    - cwd: '{{ downloads }}\ms-vcpp'

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
{% elif current_installed %}
Microsoft Visual C++ 2017 Redistributable {{ version }} is already installed:
  test.nop
{% elif newer_installed %}
A newer version of Microsoft Visual C++ 2017 is already installed:
  test.nop
{% endif %}
