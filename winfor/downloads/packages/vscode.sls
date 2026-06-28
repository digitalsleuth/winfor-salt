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
{% set guid = '7e7950df89d055b5a378379db9ee14290772148a' %}
{% set hash = '28eab4540effebb773266f231fd13e0d1b8a26bb296f44ae97054a98602b17d8' %}

vscode-download-only:
  file.managed:
    - name: '{{ downloads }}\vscode\vscode-{{ version }}.exe'
    - source: https://vscode.download.prss.microsoft.com/dbazure/download/stable/{{ guid }}/VSCodeSetup-x64-{{ version }}.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
