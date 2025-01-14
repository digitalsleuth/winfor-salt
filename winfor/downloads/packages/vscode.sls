# Name: VSCode (Visual Studio Code)
# Website: https://code.visualstudio.com/
# Description: Open Source Code Editor and Debugger
# Category: Documents / Editors
# Author: Microsoft
# License: Code - MIT License (https://github.com/microsoft/vscode/blob/main/LICENSE.txt) / Product (https://code.visualstudio.com/License/)
# Version: 1.96.3
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '1.96.3' %}
{% set guid = '91fbdddc47bc9c09064bf7acf133d22631cbf083' %}
{% set hash = 'dae685ed2708caf087c89a028818bae8c59983549b6d052164c1b3df21465cb3' %}

vscode-download-only:
  file.managed:
    - name: '{{ downloads }}\vscode\VSCodeSetup-x64-{{ version }}.exe'
    - source: https://vscode.download.prss.microsoft.com/dbazure/download/stable/{{ guid }}/VSCodeSetup-x64-{{ version }}.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
