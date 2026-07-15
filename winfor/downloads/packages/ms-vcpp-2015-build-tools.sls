# Name: Microsoft VC++ 2015 Build Tools
# Website: https://microsoft.com
# Description: Microsoft Visual C++ 2015 Build Tools
# Category: Requirements
# Author: Microsoft
# License: 
# Version: 15.9.37506.8
# Notes: 

{% set version = '15.9.37506.8' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set hash = '2c4efefdff8e6bb0394c7f96e1f9f51a9e6294b87614b86cc07aefcc8894ffbc' %}

ms-vcpp-2015-build-tools-download-only:
  file.managed:
    - name: '{{ downloads }}\ms-vcpp\ms-vcpp-2015-buildtools-{{ version }}.exe'
    - source: https://aka.ms/vs/15/release/vs_buildtools.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True

ms-vcpp-2015-build-tools-stage-download-only:
  cmd.run:
    - name: 'ms-vcpp-2015-buildtools-{{ version }}.exe --layout "{{ downloads }}\ms-vcpp\2015" --add Microsoft.VisualStudio.Workload.MSBuildTools --add Microsoft.VisualStudio.Workload.VCTools --add Microsoft.VisualStudio.Component.Windows81SDK --add Microsoft.VisualStudio.Component.VC.140 --add Microsoft.Component.VC.Runtime.UCRTSDK --lang en-US --quiet'
    - cwd: '{{ downloads }}\ms-vcpp'
    - require:
      - file: ms-vcpp-2015-build-tools-download-only
