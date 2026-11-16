# Name: Windows Winget
# Website: https://github.com/microsoft/winget-cli
# Description: Windows Package Manager
# Category: Utilities
# Author: Microsoft
# License: MIT License (https://github.com/microsoft/winget-cli/blob/master/LICENSE)
# Version: 1.29.380
# Notes: 

{% set version = '1.29.380' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

windows-winget-download-only:
  file.managed:
    - name: '{{ downloads }}\windows-winget\windows-winget-{{ version }}.msixbundle'
    - source: https://github.com/microsoft/winget-cli/releases/download/v{{ version }}/Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle
    - skip_verify: True
    - makedirs: True
