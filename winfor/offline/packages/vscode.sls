# Name: VSCode (Visual Studio Code)
# Website: https://code.visualstudio.com/
# Description: Open Source Code Editor and Debugger
# Category: Documents / Editors
# Author: Microsoft
# License: Code - MIT License (https://github.com/microsoft/vscode/blob/main/LICENSE.txt) / Product (https://code.visualstudio.com/License/)
# Version: 1.26.0
# Notes: 

{% set version = '1.126.0' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'vscode-'~ version ~'.exe' %}
{% set exists = salt['file.file_exists'](downloads + '\\vscode\\' + pkg) %}

{% if exists %}
vscode-install-offline:
  cmd.run:
    - name: '{{ pkg }} /SP- /VERYSILENT /NORESTART /MERGETASKS=!RUNCODE,ADDCONTEXTMENUFILES,ADDCONTEXTMENUFOLDERS,ADDTOPATH'
    - shell: cmd
    - cwd: '{{ downloads }}\vscode\'

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}

