# Name: Windows Winget
# Website: https://github.com/microsoft/winget-cli
# Description: Windows Package Manager
# Category: Utilities
# Author: Microsoft
# License: MIT License (https://github.com/microsoft/winget-cli/blob/master/LICENSE)
# Version: 1.10.390
# Notes: 

{% set user = salt['pillar.get']('winfor_user', 'forensics') %}
{% set LOCALAPPDATA = salt['environ.get']('LOCALAPPDATA') %}
{% set version = '1.10.390' %}

windows-winget-download:
  file.managed:
    - name: 'C:\salt\tempdownload\Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle'
    - source: https://github.com/microsoft/winget-cli/releases/download/v{{ version }}/Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle
    - skip_verify: True
    - makedirs: True

windows-winget-install:
  cmd.run:
    - name: "dism /Online /quiet /norestart /Add-ProvisionedAppxPackage /PackagePath:Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle /SkipLicense"
    - shell: cmd
    - success_retcodes: 3010
    - cwd: 'C:\salt\tempdownload\'
    - require:
      - file: windows-winget-download
