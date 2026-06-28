# Name: Microsoft VC++ 2015 Build Tools
# Website: https://microsoft.com
# Description: Microsoft Visual C++ 2015 Build Tools
# Category: Requirements
# Author: Microsoft
# License: 
# Version: 15.9.37202.19
# Notes: 

{% set version = '15.9.37202.19' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% from 'winfor/_macros/is_installed.jinja' import check_installed %}
{% set installed = check_installed('Visual Studio Build Tools 201*') | trim == 'true' %}
{% set pkg = 'ms-vcpp-2015-buildtools-'~ version ~'.exe' %}
{% set exists = salt['file.file_exists'](downloads + '\\ms-vcpp\\' + pkg) %}

{% if not installed %}
{% if exists %}

ms-vcpp-2015-build-tools-offline:
  cmd.run:
    - name: '{{ pkg }} --wait --quiet --add Microsoft.VisualStudio.Workload.MSBuildTools --add Microsoft.VisualStudio.Workload.VCTools --add Microsoft.VisualStudio.Component.Windows81SDK --add Microsoft.VisualStudio.Component.VC.140 --add Microsoft.Component.VC.Runtime.UCRTSDK'
    - shell: cmd
    - cwd: '{{ downloads }}\ms-vcpp'

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}

{% else %}
Microsoft Visual Studio Build Tools {{ version }} or higher is already installed:
  test.nop
{% endif %}
