# Name: Visual Studio Community Edition 2022
# Website: https://visualstudio.microsoft.com
# Description: Windows IDE for developing in multiple Windows-based programming languages
# Category: Requirements
# Author: Microsoft
# License: https://aka.ms/VSLicensingPaper
# Version: 17.14.4 (2022)
# Notes: Installation and application are 17.0.4, but environment is 2022 -  https://aka.ms/vs/17/release/vs_community.exe

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '17.14.4' %}
{% set guid = '94bbe6f9-0426-4afe-b73c-fbc458070e33'
{% set hash = '9cb02802530e36d67736f0e770025c782327b89ce1145ff580028f081d4d1f49' %}

vs-community-2022-download-only:
  file.managed:
    - name: '{{ downloads }}\vs-community\vs_Community_2022-{{ version }}.exe'
    - source: https://download.visualstudio.microsoft.com/download/pr/{{ guid }}/{{ hash }}/vs_Community.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
