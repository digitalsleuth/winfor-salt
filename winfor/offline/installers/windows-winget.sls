# Name: Windows Winget
# Website: https://github.com/microsoft/winget-cli
# Description: Windows Package Manager
# Category: Utilities
# Author: Microsoft
# License: MIT License (https://github.com/microsoft/winget-cli/blob/master/LICENSE)
# Version: 1.28.240
# Notes:

{% set version = '1.28.240' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set winget_version = salt['cmd.powershell']('$(try { winget -v } catch { "0" }).split("v")[1]') %}
{% set pkg = 'windows-winget-'~ version ~'.msixbundle' %}
{% set exists = salt['file.file_exists'](downloads + '\\windows-winget\\' + pkg) %}

{% if exists %}

{% if version > winget_version and winget_version != '0' %}

windows-winget-install-offline:
  cmd.run:
    - name: 'Add-AppxPackage -Path {{ downloads }}\windows-winget\{{ pkg }}'
    - shell: powershell
    - success_retcodes: 3010
    - cwd: '{{ downloads }}\windows-winget'

{% else %}
Windows Winget is already installed and at an equal or higher version - {{ winget_version }}:
  test.nop
{% endif %}

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
