# Name: Visual Studio Community Edition 2026
# Website: https://visualstudio.microsoft.com
# Description: Windows IDE for developing in multiple Windows-based programming languages
# Category: Requirements
# Author: Microsoft
# License: https://aka.ms/VSLicensingPaper
# Version: 18.7.11919.86
# Notes: Installation and application are 18.x, but environment is 2026 -  https://aka.ms/vs/17/release/vs_community.exe

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '18.7.11919.86' %}
{% set guid = '4c1645e2-fb0d-4889-a6b9-3fb6fd3a782f' %}
{% set hash = '4ef523a7c5be6b6bb2fb76329009cd7b03377a88730228d9b7639fc8114f496b' %}

vs-community-2026-download-only:
  file.managed:
    - name: '{{ downloads }}\vs-community\vs-community-2026-{{ version }}.exe'
    - source: https://download.visualstudio.microsoft.com/download/pr/{{ guid }}/{{ hash }}/vs_Community.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
