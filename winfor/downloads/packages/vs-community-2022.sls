# Name: Visual Studio Community Edition 2022
# Website: https://visualstudio.microsoft.com
# Description: Windows IDE for developing in multiple Windows-based programming languages
# Category: Requirements
# Author: Microsoft
# License: https://aka.ms/VSLicensingPaper
# Version: 17.0.4 (2022)
# Notes: Installation and application are 17.0.4, but environment is 2022

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '17.0.4' %}
{% set hash = '50c2572bd77051812ef5c9d59393f57708f994dc8f31b82c89a735712fdff26a' %}

vs-community-2022-download-only:
  file.managed:
    - name: '{{ downloads }}\vs_Community_2022.exe'
    - source: https://download.visualstudio.microsoft.com/download/pr/99fe5fea-e07c-4e6e-87ef-32a88c6ec393/{{ hash }}/vs_Community.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
