# Name: Windows Winget
# Website: https://github.com/microsoft/winget-cli
# Description: Windows Package Manager
# Category: Utilities
# Author: Microsoft
# License: MIT License (https://github.com/microsoft/winget-cli/blob/master/LICENSE)
# Version: 1.4.10173
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '1.4.10173' %}

windows-winget-download-only:
  file.managed:
    - name: '{{ downloads }}\Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle'
    - source: https://github.com/microsoft/winget-cli/releases/download/v{{ version }}/Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle
    - skip_verify: True
    - makedirs: True
