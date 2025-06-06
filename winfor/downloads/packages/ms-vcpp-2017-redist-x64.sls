# Name: Microsoft VC++ 2017+ Redistributable
# Website: https://microsoft.com
# Description: Microsoft Visual C++ 2017+ Redistributable
# Category: Requirements
# Author: Microsoft
# License: EULA
# Version: 14.44.35208.0
# Notes:

{% set version = '14.44.35208.0' %}
{% set subpath = '40b59c73-1480-4caf-ab5b-4886f176bf71/D62841375B90782B1829483AC75695CCEF680A8F13E7DE569B992EF33C6CD14A' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set hash = 'd62841375b90782b1829483ac75695ccef680a8f13e7de569b992ef33c6cd14a' %}

ms-vcpp-2017-redist-x64-download-only:
  file.managed:
    - name: '{{ downloads }}\ms-vcpp-2017-redist-x64\VC_redist.{{ version }}.x64.exe'
    - source: https://download.visualstudio.microsoft.com/download/pr/{{ subpath }}/VC_redist.x64.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
