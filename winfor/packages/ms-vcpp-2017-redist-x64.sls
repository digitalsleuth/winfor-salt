# Name: Microsoft VC++ 2017+ Redistributable
# Website: https://microsoft.com
# Description: Microsoft Visual C++ 2017+ Redistributable
# Category: Requirements
# Author: Microsoft
# License: EULA
# Version: 14.51.36247.0
# Notes:

{% set version = '14.51.36247.0' %}
{% from 'winfor/_macros/is_installed.jinja' import check_installed %}
{% set current_installed = check_installed('Microsoft Visual C++ *' + ".".join(version.split(".")[:3])) | trim == 'true' %}
{% set newer_installed = check_installed('Microsoft Visual C++ 2015-2022 *') | trim == 'true' %}
{% if not current_installed and not newer_installed %}

include:
  - winfor.repos

ms-vcpp-2017-redist_x64:
  pkg.installed

{% elif current_installed %}
Microsoft Visual C++ 2017 Redistributable {{ version }} is already installed:
  test.nop
{% elif newer_installed %}
A newer version of Microsoft Visual C++ 2017 is already installed:
  test.nop
{% endif %}
