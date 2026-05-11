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

{% if not installed %}

ms-vcpp-2015-build-tools-offline:
  cmd.run:
    - name: 'vcpp-2015-buildtools-{{ version }}.exe --wait --quiet --add Microsoft.VisualStudio.Workload.MSBuildTools --add Microsoft.VisualStudio.Workload.VCTools --add Microsoft.VisualStudio.Component.Windows81SDK --add Microsoft.VisualStudio.Component.VC.140 --add Microsoft.Component.VC.Runtime.UCRTSDK'
    - cwd: '{{ downloads }}\ms-vcpp'

{% else %}
"Microsoft Visual Studio Build Tools {{ version }} or higher is already installed":
  test.nop
{% endif %}
