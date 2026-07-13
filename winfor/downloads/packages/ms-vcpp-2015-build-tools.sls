# Name: Microsoft VC++ 2015 Build Tools
# Website: https://microsoft.com
# Description: Microsoft Visual C++ 2015 Build Tools
# Category: Requirements
# Author: Microsoft
# License: 
# Version: 15.9.37327.18
# Notes: 

{% set version = '15.9.37327.18' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set hash = 'bfdbacd40274a779c1e310112b553f0643d3e43cfffb57375ccb86a6a59611cc' %}

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
