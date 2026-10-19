# Name: VSCode (Visual Studio Code)
# Website: https://code.visualstudio.com/
# Description: Open Source Code Editor and Debugger
# Category: Documents / Editors
# Author: Microsoft
# License: Code - MIT License (https://github.com/microsoft/vscode/blob/main/LICENSE.txt) / Product (https://code.visualstudio.com/License/)
# Version: 1.126.0
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '1.126.0' %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set guid = get_hash('vscode', 'guid') %}
{% set hash = get_hash('vscode') %}

vscode-download-only:
  file.managed:
    - name: '{{ downloads }}\vscode\vscode-{{ version }}.exe'
    - source: https://vscode.download.prss.microsoft.com/dbazure/download/stable/{{ guid }}/VSCodeSetup-x64-{{ version }}.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
