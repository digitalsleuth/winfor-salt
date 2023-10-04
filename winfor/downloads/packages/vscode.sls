# Name: VSCode (Visual Studio Code)
# Website: https://code.visualstudio.com/
# Description: Open Source Code Editor and Debugger
# Category: Documents / Editors
# Author: Microsoft
# License: Code - MIT License (https://github.com/microsoft/vscode/blob/main/LICENSE.txt) / Product (https://code.visualstudio.com/License/)
# Version: 1.82.3
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '1.82.3' %}
{% set guid = 'fdb98833154679dbaa7af67a5a29fe19e55c2b73' %}
{% set hash = 'b704f7647e0efb2ce8d264e3c75846b11d07491ae6b1d9d140b8d02803b3d9fc' %}

vscode-download-only:
  file.managed:
    - name: '{{ downloads }}\VSCodeSetup-x64-{{ version }}.exe'
    - source: https://az764295.vo.msecnd.net/stable/{{ guid }}/VSCodeSetup-x64-{{ version }}.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
