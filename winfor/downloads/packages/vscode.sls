# Name: VSCode (Visual Studio Code)
# Website: https://code.visualstudio.com/
# Description: Open Source Code Editor and Debugger
# Category: Documents / Editors
# Author: Microsoft
# License: Code - MIT License (https://github.com/microsoft/vscode/blob/main/LICENSE.txt) / Product (https://code.visualstudio.com/License/)
# Version: 1.100.3
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '1.100.3' %}
{% set guid = '258e40fedc6cb8edf399a463ce3a9d32e7e1f6f3' %}
{% set hash = '50d5ca1f05bf8b46842cdc7849b4c71f561edfea107fd077c2c53037f912ee4a' %}

vscode-download-only:
  file.managed:
    - name: '{{ downloads }}\vscode\VSCodeSetup-x64-{{ version }}.exe'
    - source: https://vscode.download.prss.microsoft.com/dbazure/download/stable/{{ guid }}/VSCodeSetup-x64-{{ version }}.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
